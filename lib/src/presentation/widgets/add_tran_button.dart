// ignore_for_file: use_build_context_synchronously

import '../../../exports.dart';
import '../../data/model/category.dart';
import '../modules/category/picker/category_picker_dialog.dart';
import '../modules/transaction/add/add_transaction_dialog.dart';

class AddTranButtons extends ConsumerWidget {
  const AddTranButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          style: ButtonStyle(
            foregroundColor: ButtonState.all(Colors.green),
          ),
          child: Row(
            children: const [
              Icon(FluentIcons.add),
              SizedBox(width: 8),
              Text('ចំណូល'),
            ],
          ),
          onPressed: () async {
            final category =
                await CategoryPickerDialog.show(context, type: CategoryType.income);
            AddTransactionDialog.show(context,
                type: CategoryType.income, categoryId: category);
          },
        ),
        const SizedBox(width: 18),
        OutlinedButton(
          style: ButtonStyle(
            foregroundColor: ButtonState.all(Colors.red),
          ),
          child: Row(
            children: const [
              Icon(FluentIcons.calculator_subtract),
              SizedBox(width: 8),
              Text('ចំណាយ'),
            ],
          ),
          onPressed: () async {
            final category =
                await CategoryPickerDialog.show(context, type: CategoryType.expense);

            AddTransactionDialog.show(context,
                type: CategoryType.expense, categoryId: category);
          },
        )
      ],
    );
  }
}
