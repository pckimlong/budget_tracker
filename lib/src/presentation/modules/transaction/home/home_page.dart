import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/add/add_transaction_dialog.dart';
import 'package:budget_tracker/src/presentation/widgets/my_date_pickeer.dart';
import 'package:budget_tracker/src/providers/category_providers.dart';
import 'package:budget_tracker/src/providers/tran_providers.dart';

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
          ),
          const Expanded(child: _TranList())
        ],
      ),
    );
  }
}

class _TranList extends ConsumerWidget {
  const _TranList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(_dateFilter);
    final listAsync = ref.watch(TranProviders.ofDate(date));

    return listAsync.when(
      data: (trans) {
        if (trans.isEmpty) {
          return const Center(
            child: Text('ពុំមានប្រតិបត្តិការទេ'),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemCount: trans.length,
          itemBuilder: (_, index) {
            return ProviderScope(
              overrides: [_itemProvider.overrideWithValue(trans[index])],
              child: const _Item(),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
        );
      },
      error: (err, __) {
        return Center(child: Text(err.toString()));
      },
      loading: () => const Center(
        child: ProgressRing(),
      ),
    );
  }
}

final _itemProvider = Provider<Tran>((ref) {
  throw UnimplementedError();
});

class _Item extends ConsumerWidget {
  const _Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(_itemProvider);
    final category = ref.watch(CategoryProviders.ofId(data.categoryId));

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data.date.format(false),
          ),
          Text(category.value?.name ?? ""),
          Text(data.note),
          Text(data.amount.moneyFormat()),
          const Text('data'),
          const Text('balance'),
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
