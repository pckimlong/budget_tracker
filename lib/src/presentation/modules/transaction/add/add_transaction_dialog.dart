import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/core/app_style.dart';
import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/presentation/modules/category/picker/category_picker_dialog.dart';
import 'package:budget_tracker/src/presentation/widgets/my_date_pickeer.dart';
import 'package:budget_tracker/src/providers/category_providers.dart';
import 'package:budget_tracker/src/providers/tran_providers.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../exports.dart';
import '../../../../core/app_helper.dart';
import '../../../widgets/my_filled_button.dart';

final _dataProvider = StateProvider.autoDispose<Category>((ref) {
  throw UnimplementedError();
});

class AddTransactionDialog extends HookConsumerWidget {
  const AddTransactionDialog({
    Key? key,
    required this.type,
    this.initialCateId,
  }) : super(key: key);

  final CategoryType type;

  static void show(BuildContext context,
      {required CategoryType type, CategoryId? categoryId}) {
    showDialog(
      context: context,
      builder: (_) => ProviderScope(
        overrides: [
          _dataProvider
              .overrideWithValue(StateController(Category(type: type, name: ''))),
        ],
        child: AddTransactionDialog(
          type: type,
          initialCateId: categoryId,
        ),
      ),
    );
  }

  final CategoryId? initialCateId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final savingState = ref.watch(TranProviders.add);

    useMemoized(() {
      if (initialCateId.isNotNullOrBlank) {
        Future.microtask(() => ref
            .read(TranProviders.addData.notifier)
            .onCategoryChanged(initialCateId ?? ""));
      }
    });

    String headline6;
    switch (type) {
      case CategoryType.income:
        headline6 = 'កត់ត្រាចំណូល';
        break;
      case CategoryType.expense:
        headline6 = "កត់ត្រាចំណាយ";
        break;
    }

    ref.listen<AsyncValue<bool>>(
      TranProviders.add,
      (previous, next) {
        if (previous?.isLoading == true && next == const AsyncValue.data(true)) {
          Navigator.pop(context);
        }
      },
    );

    return ContentDialog(
      title: Text(headline6),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const _Date(),
            const SizedBox(height: 14),
            _Category(type: type),
            const SizedBox(height: 14),
            const _Note(),
            const SizedBox(height: 14),
            _Amount(type: type),
            if (savingState.hasError) ...[
              const SizedBox(height: 14),
              InfoBar(
                title: Text(savingState.error.toString()),
                severity: InfoBarSeverity.error,
              )
            ],
          ],
        ),
      ),
      actions: [
        MyFilledButton(
          child: savingState.isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: ProgressRing(),
                )
              : const Text('រក្សាទុក'),
          onPressed: () async {
            formKey.currentState!.save();
            if (formKey.currentState!.validate()) {
              final save = ref.read(TranProviders.add.notifier);
              await save();
            }
          },
        ),
        SizedBox(
          height: AS.buttonHeight,
          child: Button(
            child: const Text("ត្រលប់"),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}

class _Date extends ConsumerWidget {
  const _Date({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(TranProviders.addData.select((value) => value.date));

    return Align(
      alignment: Alignment.centerLeft,
      child: MyDatePicker(
        onDateChanged: ref.read(TranProviders.addData.notifier).onDateChanged,
        selectedDate: state,
      ),
    );
  }
}

class _Category extends HookConsumerWidget {
  const _Category({Key? key, required this.type}) : super(key: key);

  final CategoryType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedId = ref.watch(TranProviders.addData
        .select((value) => value.categoryId.isBlank ? null : value.categoryId));
    final controller = useTextEditingController();
    final name = ref.watch(
        CategoryProviders.ofId(selectedId).select((value) => value.valueOrNull?.name));

    useEffect(() {
      Future.microtask(() => controller.text = name ?? "");
      return null;
    }, [selectedId]);

    return TextFormBox(
      controller: controller,
      style: context.theme.typography.body,
      validator: FormBuilderValidators.required(),
      readOnly: true,
      onTap: () async {
        final result =
            await CategoryPickerDialog.show(context, type: type, initial: selectedId);
        if (result != null) {
          ref.read(TranProviders.addData.notifier).onCategoryChanged(result);
        }
      },
      placeholder: 'ជ្រើសរើសប្រភេទ${type.khmer()}',
    );
  }
}

class _Note extends HookConsumerWidget {
  const _Note({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return TextFormBox(
      controller: controller,
      style: context.theme.typography.body,
      onChanged: (value) {
        EasyDebounce.debounce('note', const Duration(milliseconds: 300), () {
          ref.read(TranProviders.addData.notifier).onNoteChanged(value);
        });
      },
      placeholder: 'កត់ចំណាំ',
      maxLines: 5,
    );
  }
}

class _Amount extends HookConsumerWidget {
  const _Amount({Key? key, required this.type}) : super(key: key);

  final CategoryType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final focus = useFocusNode();
    final color = type == CategoryType.expense ? Colors.red : Colors.green;
    final sign = type == CategoryType.expense ? "-" : "+";
    final textStyle = TextStyle(
      fontFamily: 'Battambang',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: color,
    );

    ref.listen<String>(
      TranProviders.addData.select((value) => value.categoryId),
      (previous, next) {
        if (previous.isNullOrBlank && next.isNotNullOrBlank) {
          focus.requestFocus();
        }
      },
    );

    return SizedBox(
      width: 250,
      child: TextFormBox(
        controller: controller,
        focusNode: focus,
        onChanged: (value) {
          EasyDebounce.debounce(
            'amount',
            const Duration(milliseconds: 200),
            () {
              if (value.toDoubleOrNull() == null) return;
              ref
                  .read(TranProviders.addData.notifier)
                  .onAmountChanged(value.toDouble());
            },
          );
        },
        placeholder: '0.00',
        placeholderStyle: textStyle,
        inputFormatters: inputFormatterNumeric,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.numeric(),
          FormBuilderValidators.notEqual(0),
        ]),
        prefix: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text("$sign \$", style: textStyle),
        ),
        style: textStyle,
      ),
    );
  }
}
