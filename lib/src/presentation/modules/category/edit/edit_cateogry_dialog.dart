import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/providers/category_providers.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../exports.dart';
import '../../../../core/app_style.dart';
import '../../../widgets/my_filled_button.dart';

class EditCategoryDialog extends ConsumerWidget {
  const EditCategoryDialog({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  static void show(
    BuildContext context, {
    required CategoryId toUpdateId,
  }) {
    showDialog(
      context: context,
      builder: (_) => EditCategoryDialog(categoryId: toUpdateId),
      barrierDismissible: true,
    );
  }

  final CategoryId categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(CategoryProviders.updateData(categoryId));

    return dataAsync.when(
      data: (data) {
        return ProviderScope(
          overrides: [_initialDataProvider.overrideWithValue(data)],
          child: const _WhenData(),
        );
      },
      error: (err, _) => Center(child: Text(err.toString())),
      loading: () => const Center(child: ProgressRing()),
    );
  }
}

final _initialDataProvider = Provider<Category>((ref) {
  throw UnimplementedError();
});

class _WhenData extends HookConsumerWidget {
  const _WhenData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(_initialDataProvider);
    final id = data.id!;

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController(text: data.name);

    final updateState = ref.watch(CategoryProviders.update(id));

    ref.listen<AsyncValue<bool>>(
      CategoryProviders.update(id),
      (previous, next) {
        if (previous?.isLoading == true && next == const AsyncValue.data(true)) {
          EasyLoading.showToast(
            'បានកែដោយជោគជ័យ',
            toastPosition: EasyLoadingToastPosition.top,
          );
          Navigator.pop(context);
        }
      },
    );

    return ContentDialog(
      title: const Text('កែឈ្មោះប្រភេទ'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: formKey,
            child: TextFormBox(
              autofocus: true,
              onChanged: (value) {
                EasyDebounce.debounce('name', const Duration(milliseconds: 200), () {
                  ref
                      .read(CategoryProviders.updateData(id).notifier)
                      .onNameChanged(value);
                });
              },
              controller: nameController,
              placeholder: 'Enter category name',
              validator: FormBuilderValidators.required(errorText: 'សូមបំពេញ'),
            ),
          ),
          const SizedBox(height: 20),
          if (updateState.hasError)
            InfoBar(
              title: Text(updateState.error.toString()),
              severity: InfoBarSeverity.error,
            ),
          if (updateState == const AsyncValue.data(true))
            const InfoBar(
              title: Text("បានកែជោគជ័យ"),
              severity: InfoBarSeverity.success,
            ),
        ],
      ),
      actions: [
        MyFilledButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              final update = ref.read(CategoryProviders.update(id).notifier);
              await update();
            }
          },
          child: updateState.isLoading
              ? const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: ProgressRing(),
                  ),
                )
              : const Text('រក្សាទុក'),
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
