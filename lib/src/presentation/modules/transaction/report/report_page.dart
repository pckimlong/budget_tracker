import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/presentation/widgets/my_box.dart';
import 'package:budget_tracker/src/presentation/widgets/my_date_pickeer.dart';
import 'package:budget_tracker/src/providers/report_provider.dart';

import '../../../../../exports.dart';
import '../../../../data/model/category.dart';
import '../../../../providers/category_providers.dart';

class ReportPage extends ConsumerWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldPage.withPadding(
      header: const PageHeader(
        title: Text('របាយការណ៍ចំណូលចំណាយ'),
        commandBar: _DateRange(),
      ),
      content: const _Content(),
    );
  }
}

class _DateRange extends ConsumerWidget {
  const _DateRange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startDate = ref.watch(ReportProvider.startDate);
    final endDate = ref.watch(ReportProvider.endDate);

    return Row(
      children: [
        const Text('ចាប់ពីថ្ងៃ'),
        const SizedBox(width: 12),
        MyDatePicker(
          onDateChanged: (newDate) {
            ref.read(ReportProvider.startDate.notifier).state = newDate;
          },
          selectedDate: startDate,
          useYtdTodayTmr: false,
        ),
        const SizedBox(width: 12),
        const Text('ដល់ថ្ងៃ'),
        const SizedBox(width: 12),
        MyDatePicker(
          onDateChanged: (newDate) {
            ref.read(ReportProvider.endDate.notifier).state = newDate;
          },
          selectedDate: endDate,
          useYtdTodayTmr: false,
        ),
        const SizedBox(width: 12),
        IconButton(
          icon: const Icon(FluentIcons.refresh),
          onPressed: () => ref.invalidate(ReportProvider.ofDateRange),
        )
      ],
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(color: context.theme.accentColor.withOpacity(0.1)),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: DefaultTextStyle(
        style: context.theme.typography.bodyStrong!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(child: Text("កាលបរិច្ឆេទ")),
            Expanded(child: Text("ប្រភេទចំណូលចំណាយ")),
            Expanded(flex: 3, child: Text("កំណត់ត្រា")),
            Expanded(flex: 2, child: Text("ចំណូល & ចំណាយ")),
          ],
        ),
      ),
    );
  }
}

class _Content extends ConsumerWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(ReportProvider.ofDateRange
        .select((value) => value.whenData((value) => value.length)));

    return reportAsync.when(
      data: (count) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: MyBox(
                margin: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(child: _TotalBalance()),
                    Expanded(child: _CategoryList()),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: _TranList(itemCount: count)),
          ],
        );
      },
      error: (err, _) => Center(child: Text(err.toString())),
      loading: () => const Center(child: ProgressRing()),
    );
  }
}

class _TotalBalance extends ConsumerWidget {
  const _TotalBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalIncome = ref.watch(ReportProvider.totalIncome).valueOrNull ?? 0;
    final totalExpense = ref.watch(ReportProvider.totalExpense).valueOrNull ?? 0;
    final remaining = ref.watch(ReportProvider.totalRemaining).valueOrNull ?? 0;

    final textStyle = context.theme.typography.bodyStrong!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 90,
              child: Text('ចំណូលសរុប'),
            ),
            const SizedBox(width: 20),
            Text(
              "+${totalIncome.moneyFormat()}",
              style: textStyle.copyWith(color: Colors.green),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 90,
              child: Text('ចំណាយសរុប'),
            ),
            const SizedBox(width: 20),
            Text(
              "-${totalExpense.moneyFormat()}",
              style: textStyle.copyWith(color: Colors.red),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 90,
              child: Text('សរុប'),
            ),
            const SizedBox(width: 20),
            Text(" ${remaining.moneyFormat()}", style: textStyle),
          ],
        ),
      ],
    );
  }
}

class _CategoryList extends ConsumerWidget {
  const _CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cateIdsAsync = ref.watch(ReportProvider.ofDateRange.select((value) =>
        value.whenData((value) =>
            value.map((element) => element.categoryId).toIList().removeDuplicates())));

    return cateIdsAsync.when(
      data: (ids) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return ProviderScope(
              overrides: [_cateIdProvider.overrideWithValue(ids[index])],
              child: const _CategoryItem(),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: ids.length,
        );
      },
      error: (err, __) => Center(child: Text(err.toString())),
      loading: () => const Center(child: ProgressRing()),
    );
  }
}

final _cateIdProvider = Provider<String>((ref) {
  throw UnimplementedError();
});

class _CategoryItem extends ConsumerWidget {
  const _CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(_cateIdProvider);
    final balance = ref.watch(ReportProvider.totalOfCategory(id)).valueOrNull ?? 0;
    final data = ref.watch(CategoryProviders.ofId(id));

    return data.when(
      data: (cate) {
        String cateBalance = balance.moneyFormat();
        Color? color;

        switch (cate!.type) {
          case CategoryType.income:
            cateBalance = "+ $cateBalance";
            color = Colors.green;
            break;
          case CategoryType.expense:
            cateBalance = "- $cateBalance";
            color = Colors.red;
            break;
        }

        return Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(FluentIcons.square_shape_solid, size: 8),
                  const SizedBox(width: 12),
                  Text(cate.name),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                cateBalance,
                style: context.theme.typography.bodyStrong!.copyWith(color: color),
              ),
            ),
          ],
        );
      },
      error: (err, _) => Text(err.toString()),
      loading: () => const ProgressBar(),
    );
  }
}

class _TranList extends ConsumerWidget {
  const _TranList({Key? key, required this.itemCount}) : super(key: key);

  final int itemCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const MyBox(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(0),
          child: _Header(),
        ),
        const SizedBox(height: 4),
        MyBox(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return ProviderScope(
                overrides: [
                  _indexProvider.overrideWithValue(index),
                ],
                child: const _TranItem(),
              );
            },
            itemCount: itemCount,
          ),
        ),
      ],
    );
  }
}

final _indexProvider = Provider<int>((ref) {
  throw UnimplementedError();
});

class _TranItem extends ConsumerWidget {
  const _TranItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(_indexProvider);

    final data = ref.watch(ReportProvider.ofIndex(index)).value!;

    final category = ref.watch(CategoryProviders.ofId(data.categoryId));

    DateTime? previousDate;
    if (index > 0) {
      previousDate = ref.watch(
          ReportProvider.ofIndex(index - 1).select((value) => value.valueOrNull?.date));
    }
    final showDate = (previousDate != null && previousDate != data.date) || index == 0;

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

    String date = "";
    if (showDate) {
      date = data.date.format(false);
    }

    final nextDate = ref.watch(
        ReportProvider.ofIndex(index + 1).select((value) => value.valueOrNull?.date));
    final showTotal = (nextDate != null && nextDate != data.date) || nextDate == null;
    String? totalString;
    if (showTotal) {
      final total = ref.watch(ReportProvider.totalOfDate(data.date)).valueOrNull;
      totalString = total?.moneyFormat();
    }

    return Column(
      children: [
        if (showDate && index != 0) ...[
          const SizedBox(height: 20),
          const Divider(style: DividerThemeData(horizontalMargin: EdgeInsets.all(0))),
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text(date)),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Divider(
                        style: DividerThemeData(horizontalMargin: EdgeInsets.all(0)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (totalString.isNotNullOrBlank)
          DefaultTextStyle(
            style: context.theme.typography.body!.copyWith(
              color: Colors.black.withAlpha(50),
            ),
            child: Row(
              children: [
                const Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      '=',
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                Expanded(flex: 2, child: Text(totalString!)),
              ],
            ),
          ),
      ],
    );
  }
}
