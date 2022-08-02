import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/add/add_transaction_dialog.dart';
import 'package:budget_tracker/src/presentation/widgets/my_box.dart';
import 'package:budget_tracker/src/presentation/widgets/my_date_pickeer.dart';
import 'package:budget_tracker/src/providers/category_providers.dart';
import 'package:budget_tracker/src/providers/tran_providers.dart';

import '../../../../../exports.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  static final dateFilter = StateProvider<DateTime>((ref) {
    return DateTime.now();
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldPage.withPadding(
      bottomBar: const Padding(
        padding: EdgeInsets.all(18),
        child: _AddButtons(),
      ),
      header: PageHeader(
        padding: 18,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ចំណូលចំណាយប្រចាំថ្ងៃ',
              style: context.theme.typography.title,
            ),
            const Divider(),
            const SizedBox(height: 10),
            const _DateFilter(),
          ],
        ),
        commandBar: const _Balance(),
      ),
      content: const _TranList(),
    );
  }
}

class _Balance extends ConsumerWidget {
  const _Balance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(HomePage.dateFilter);
    final totalIncome = ref.watch(TranProviders.totalIncomeOfDate(date));
    final totalExpense = ref.watch(TranProviders.totalExpenseOfDate(date));
    final total = ref.watch(TranProviders.totalRemainingOfDate(date));

    return Row(
      children: [
        MyBox(
          child: InfoLabel(
            label: 'ចំណូលសរុប',
            child: totalIncome.maybeWhen(
              data: (data) => Text(data.moneyFormat()),
              orElse: () => const Text('...'),
            ),
          ),
        ),
        const SizedBox(width: 20),
        MyBox(
          child: InfoLabel(
            label: 'ចំណាយសរុប',
            child: totalExpense.maybeWhen(
              data: (data) => Text(data.moneyFormat()),
              orElse: () => const Text('...'),
            ),
          ),
        ),
        const SizedBox(width: 20),
        MyBox(
          child: InfoLabel(
            label: 'នៅសល់សរុប',
            child: total.maybeWhen(
              data: (data) => Text(data.moneyFormat()),
              orElse: () => const Text('...'),
            ),
          ),
        ),
      ],
    );
  }
}

class _TranList extends ConsumerWidget {
  const _TranList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(HomePage.dateFilter);
    final listAsync = ref.watch(TranProviders.ofDate(date));

    return listAsync.when(
      data: (trans) {
        if (trans.isEmpty) {
          return const Center(
            child: Text('ពុំមានប្រតិបត្តិការទេ'),
          );
        }

        return Column(
          children: [
            const SizedBox(height: 25),
            const _Header(),
            Expanded(
              child: ListView.separated(
                itemCount: trans.length,
                itemBuilder: (_, index) {
                  return ProviderScope(
                    overrides: [_itemProvider.overrideWithValue(trans[index])],
                    child: const _Item(),
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
              ),
            ),
          ],
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

class _Header extends ConsumerWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTextStyle(
      style: context.theme.typography.bodyStrong!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(child: Text("កាលបរិច្ឆេទ")),
          Expanded(child: Text("ប្រភេទចំណូលចំណាយ")),
          Expanded(flex: 3, child: Text("កំណត់ត្រា")),
          Expanded(flex: 2, child: Text("ចំណូល & ចំណាយ")),
          SizedBox(width: 28),
        ],
      ),
    );
  }
}

class _Item extends ConsumerWidget {
  const _Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(_itemProvider);
    final category = ref.watch(CategoryProviders.ofId(data.categoryId));

    String amount = data.amount.moneyFormat();
    Color? amountColor;
    category.whenData((value) {
      switch (value!.type) {
        case CategoryType.income:
          amount = "+${data.amount.moneyFormat()}";
          amountColor = Colors.green;
          break;
        case CategoryType.expense:
          amount = "-${data.amount.moneyFormat()}";
          amountColor = Colors.red;
          break;
      }
    });

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(data.date.format(false))),
          Expanded(child: Text(category.value?.name ?? "")),
          Expanded(flex: 3, child: Text(data.note)),
          Expanded(
            flex: 2,
            child: Text(
              amount,
              style: TextStyle(
                color: amountColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          DropDownButton(
            buttonBuilder: (context, onOpen) {
              return IconButton(
                onPressed: onOpen,
                icon: const Icon(FluentIcons.more_vertical),
              );
            },
            items: [
              MenuFlyoutItem(
                text: const Text('កែប្រែ'),
                leading: const Icon(FluentIcons.edit),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                text: Text('លុប', style: TextStyle(color: Colors.red)),
                leading: Icon(FluentIcons.delete, color: Colors.red),
                onPressed: () {},
              ),
            ],
          ),
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
          onPressed: () =>
              AddTransactionDialog.show(context, type: CategoryType.income),
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
    final selectedDate = ref.watch(HomePage.dateFilter);

    return MyDatePicker(
      onDateChanged: (newDate) => _updateFilter(ref, newDate),
      selectedDate: selectedDate,
      showNavigator: true,
    );
  }

  void _updateFilter(WidgetRef ref, DateTime newDate) {
    ref.read(HomePage.dateFilter.notifier).state = newDate;
  }
}
