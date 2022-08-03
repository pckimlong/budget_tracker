// ignore_for_file: use_build_context_synchronously

import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:budget_tracker/src/presentation/modules/category/picker/category_picker_dialog.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/add/add_transaction_dialog.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/delete/delete_transaction_dialog.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/edit/edit_transaction_dialog.dart';
import 'package:budget_tracker/src/presentation/widgets/my_box.dart';
import 'package:budget_tracker/src/presentation/widgets/my_date_pickeer.dart';
import 'package:budget_tracker/src/providers/category_providers.dart';
import 'package:budget_tracker/src/providers/tran_providers.dart';

import '../../../../../exports.dart';
import '../../../../../main.dart';

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
          Expanded(flex: 2, child: Text("ប្រភេទចំណូលចំណាយ")),
          Expanded(flex: 4, child: Text("កំណត់ត្រា")),
          Expanded(flex: 2, child: Text("ចំណូល & ចំណាយ")),
          Expanded(child: SizedBox.shrink())
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
          Expanded(flex: 2, child: Text(category.value?.name ?? "")),
          Expanded(flex: 4, child: Text(data.note)),
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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(FluentIcons.delete),
                  onPressed: () {
                    DeleteTransactionDialog.show(context, toDelete: data);
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(FluentIcons.edit),
                  onPressed: () {
                    EditTransactionDialog.show(context, toUpdateId: data.id!);
                  },
                ),
              ],
            ),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
                final category = await CategoryPickerDialog.show(context,
                    type: CategoryType.expense);

                AddTransactionDialog.show(context,
                    type: CategoryType.expense, categoryId: category);
              },
            )
          ],
        ),
        DefaultTextStyle(
          style: context.theme.typography.caption!,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text('Version $appVersion'),
                SizedBox(width: 20),
                Text('Powered by Kimapp'),
              ],
            ),
          ),
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
