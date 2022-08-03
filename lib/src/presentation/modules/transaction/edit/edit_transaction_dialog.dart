import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:budget_tracker/src/providers/tran_providers.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../exports.dart';
import '../../../../core/app_helper.dart';
import '../../../../core/app_style.dart';
import '../../../../data/model/category.dart';
import '../../../../providers/category_providers.dart';
import '../../../widgets/my_date_pickeer.dart';
import '../../../widgets/my_filled_button.dart';
import '../../category/picker/category_picker_dialog.dart';

class EditTransactionDialog extends ConsumerWidget {
  const EditTransactionDialog({
    Key? key,
    required this.id,
  }) : super(key: key);

  final TranId id;

  static void show(BuildContext context, {required TranId toUpdateId}) {
    showDialog(
      context: context,
      builder: (_) => EditTransactionDialog(id: toUpdateId),
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updatingDataState = ref.watch(TranProviders.ofId(id));

    return updatingDataState.when(
      data: (data) {
        final categoryAsync = ref.watch(CategoryProviders.ofId(data.categoryId));

        return categoryAsync.when(
          data: (category) {
            return ProviderScope(
              overrides: [
                _initialDataProvider.overrideWithValue(data),
                _typeProvider.overrideWithValue(category!.type),
                _idProvider.overrideWithValue(data.id!)
              ],
              child: const _WhenData(),
            );
          },
          error: (err, _) => Center(child: Text(err.toString())),
          loading: () => const Center(child: ProgressRing()),
        );
      },
      error: (err, _) => Center(child: Text(err.toString())),
      loading: () => const Center(child: ProgressRing()),
    );
  }
}

final _initialDataProvider = Provider<Tran>((ref) {
  throw UnimplementedError();
});

final _typeProvider = Provider<CategoryType>((ref) {
  throw UnimplementedError();
});

final _idProvider = Provider<CategoryId>((ref) {
  throw UnimplementedError();
});

class _WhenData extends HookConsumerWidget {
  const _WhenData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final data = ref.watch(_initialDataProvider);
    final id = data.id!;

    final updatingState = ref.watch(TranProviders.update(id));

    ref.listen<AsyncValue<bool>>(
      TranProviders.update(id),
      (previous, next) {
        if (previous?.isLoading == true && next == const AsyncValue.data(true)) {
          EasyLoading.showToast('បានកែដោយជោគជ័យ',
              toastPosition: EasyLoadingToastPosition.top);
          Navigator.pop(context);
        }
      },
    );

    return ContentDialog(
      title: const Text("កែទិន្នន័យនៃប្រតិបត្តិការ"),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const _Date(),
            const SizedBox(height: 14),
            const _Category(),
            const SizedBox(height: 14),
            const _Note(),
            const SizedBox(height: 14),
            const _Amount(),
            if (updatingState.hasError) ...[
              const SizedBox(height: 14),
              InfoBar(
                title: Text(updatingState.error.toString()),
                severity: InfoBarSeverity.error,
              )
            ],
          ],
        ),
      ),
      actions: [
        MyFilledButton(
          child: updatingState.isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: ProgressRing(),
                )
              : const Text('រក្សាទុក'),
          onPressed: () async {
            formKey.currentState!.save();
            if (formKey.currentState!.validate()) {
              final update = ref.read(TranProviders.update(id).notifier);
              await update();
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
    final id = ref.watch(_idProvider);
    final state =
        ref.watch(TranProviders.updateData(id).select((value) => value.value!.date));

    return Align(
      alignment: Alignment.centerLeft,
      child: MyDatePicker(
        onDateChanged: ref.read(TranProviders.updateData(id).notifier).onDateChanged,
        selectedDate: state,
      ),
    );
  }
}

class _Category extends HookConsumerWidget {
  const _Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(_idProvider);
    final type = ref.watch(_typeProvider);

    final selectedId = ref.watch(TranProviders.updateData(id).select(
        (value) => value.value!.categoryId.isBlank ? null : value.value!.categoryId));
    final controller = useTextEditingController();

    final name = ref.watch(
        CategoryProviders.ofId(selectedId).select((value) => value.valueOrNull?.name));

    useEffect(() {
      Future.microtask(() => controller.text = name ?? "");
      return null;
    }, [selectedId]);

    return TextFormBox(
      controller: controller,
      validator: FormBuilderValidators.required(),
      readOnly: true,
      onTap: () async {
        final result =
            await CategoryPickerDialog.show(context, type: type, initial: selectedId);
        if (result != null) {
          ref.read(TranProviders.updateData(id).notifier).onCategoryChanged(result);
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
    final id = ref.watch(_idProvider);
    final initial = ref.watch(_initialDataProvider.select((value) => value.note));
    final controller = useTextEditingController(text: initial);

    return TextFormBox(
      controller: controller,
      onChanged: (value) {
        EasyDebounce.debounce('note', const Duration(milliseconds: 300), () {
          ref.read(TranProviders.updateData(id).notifier).onNoteChanged(value);
        });
      },
      placeholder: 'កត់ចំណាំ',
      maxLines: 5,
    );
  }
}

class _Amount extends HookConsumerWidget {
  const _Amount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(_idProvider);
    final type = ref.watch(_typeProvider);
    final initialAmount =
        ref.watch(_initialDataProvider.select((value) => value.amount));

    final controller = useTextEditingController(text: initialAmount.toString());
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
      TranProviders.updateData(id).select((value) => value.value!.categoryId),
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
                  .read(TranProviders.updateData(id).notifier)
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
