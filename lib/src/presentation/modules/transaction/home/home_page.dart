import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/add/add_transaction_dialog.dart';
import 'package:budget_tracker/src/presentation/widgets/my_date_pickeer.dart';

import '../../../../../exports.dart';
import '../../../widgets/my_filled_button.dart';

final _dateFilter = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldPage.withPadding(
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _DateFilter(),
              _AddButtons(),
            ],
          )
        ],
      ),
    );
  }
}

class _AddButtons extends ConsumerWidget {
  const _AddButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        MyFilledButton(
          backgroundColor: Colors.green,
          child: Row(
            children: const [
              Icon(FluentIcons.add),
              SizedBox(width: 8),
              Text('ចំណូល'),
            ],
          ),
          onPressed: () =>
              AddTransactionDialog.show(context, type: CategoryType.income),
        ),
        const SizedBox(width: 12),
        MyFilledButton(
          backgroundColor: Colors.red,
          child: Row(
            children: const [
              Icon(FluentIcons.add),
              SizedBox(width: 8),
              Text('ចំណាយ'),
            ],
          ),
          onPressed: () =>
              AddTransactionDialog.show(context, type: CategoryType.expense),
        )
      ],
    );
  }
}

class _DateFilter extends ConsumerWidget {
  const _DateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(_dateFilter);

    return MyDatePicker(
      onDateChanged: (newDate) => _updateFilter(ref, newDate),
      selectedDate: selectedDate,
      showNavigator: true,
    );
  }

  void _updateFilter(WidgetRef ref, DateTime newDate) {
    ref.read(_dateFilter.notifier).state = newDate;
  }
}
