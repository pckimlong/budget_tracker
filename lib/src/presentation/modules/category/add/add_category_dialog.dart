import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/providers/category_providers.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../exports.dart';
import '../../../../core/app_style.dart';
import '../../../widgets/my_filled_button.dart';

class AddCategoryDialog extends HookConsumerWidget {
  const AddCategoryDialog({Key? key, required this.type}) : super(key: key);

  static void show(BuildContext context, {required CategoryType initialType}) {
    showDialog(
      context: context,
      builder: (_) => AddCategoryDialog(type: initialType),
    );
  }

  final CategoryType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final controller = useTextEditingController();
    final saveState = ref.watch(CategoryProviders.add);

    return ContentDialog(
      title: Text('បង្កើតប្រភេទ${type.khmer()}ថ្មី'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: formKey,
            child: TextFormBox(
              autofocus: true,
              controller: controller,
              placeholder: 'Enter category name',
              validator: FormBuilderValidators.required(errorText: 'សូមបំពេញ'),
            ),
          ),
          if (saveState.hasError)
            InfoBar(
              title: Text(saveState.error.toString()),
              severity: InfoBarSeverity.error,
            ),
          if (saveState == const AsyncValue.data(true))
            const InfoBar(
              title: Text("បង្កើតបានជោគជ័យ"),
              severity: InfoBarSeverity.success,
            ),
          Text(saveState.toString())
        ],
      ),
      actions: [
        MyFilledButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              final name = controller.text.trim();
              final save = ref.read(CategoryProviders.add.notifier);
              await save(Category(type: type, name: name));
            }
          },
          child: saveState.isLoading
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
