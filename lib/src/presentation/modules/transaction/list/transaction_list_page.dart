import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/providers/tran_list_provider.dart';

import '../../../../../exports.dart';
import '../../../../data/model/category.dart';
import '../../../../data/model/tran.dart';
import '../../../../providers/category_providers.dart';
import '../delete/delete_transaction_dialog.dart';
import '../edit/edit_transaction_dialog.dart';

class TransactionListPage extends ConsumerWidget {
  const TransactionListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldPage.withPadding(
      header: const PageHeader(
        title: Text('ប្រវត្តិចំណូលចំណាយ'),
        commandBar: _FilterBar(),
      ),
      content: Column(
        children: const [
          _Blank(),
          SizedBox(height: 20),
          _Header(),
          Expanded(child: _TranList()),
        ],
      ),
    );
  }
}

class _Blank extends ConsumerWidget {
  const _Blank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(TranListProvider.fetchingMore);
    return const SizedBox.shrink();
  }
}

class _FilterBar extends ConsumerWidget {
  const _FilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories =
        ref.watch(CategoryProviders.streamAll).valueOrNull ?? const IListConst([]);

    final baseList =
        categories.map((e) => ComboboxItem(value: e, child: Text(e.name))).toList();

    final selected = ref.watch(TranListProvider.categoryFilter);
    final selectedIsValid = categories.contains(selected);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('ប្រភេទ:  '),
        SizedBox(
          width: 200,
          child: Combobox<Category?>(
            value: selected,
            placeholder: const Text("បង្ហាញគ្រប់ប្រភេទ"),
            onChanged: (value) {
              ref.read(TranListProvider.categoryFilter.notifier).state = value;
            },
            items: [
              const ComboboxItem(value: null, child: Text('បង្ហាញគ្រប់ប្រភេទ')),
              if (!selectedIsValid && selected != null)
                ComboboxItem(value: selected, child: Text(selected.name)),
              ...baseList,
            ],
          ),
        ),
      ],
    );
  }
}

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
          Expanded(child: Text("ប្រភេទ")),
          Expanded(flex: 3, child: Text("កំណត់ត្រា")),
          Expanded(flex: 2, child: Text("ចំណូល & ចំណាយ")),
          Expanded(child: SizedBox.shrink()),
        ],
      ),
    );
  }
}

class _TranList extends HookConsumerWidget {
  const _TranList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mounted = useIsMounted();
    final count =
        ref.watch(TranListProvider.pagination.select((value) => value.length));

    return ListView.separated(
      itemBuilder: (_, index) {
        if (index == count) {
          if (mounted()) {
            Future.microtask(
              () => ref.read(TranListProvider.fetchingMore.notifier)(),
            );
          }
          return const _FetchMoreItem();
        }
        return ProviderScope(
          overrides: [_indexProvider.overrideWithValue(index)],
          child: const _TranItem(),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
      itemCount: count + 1,
    );
  }
}

class _FetchMoreItem extends ConsumerWidget {
  const _FetchMoreItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchMoreState = ref.watch(TranListProvider.fetchingMore);
    return fetchMoreState.when(
      data: (_) => const SizedBox.shrink(),
      error: (err, _) => Center(child: Text(err.toString())),
      loading: () => const Center(child: ProgressRing()),
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
    final dataAsynce = ref.watch(TranListProvider.ofIndex(index));

    const empty = SizedBox.shrink();

    return dataAsynce.match(
      (t) => _Item(data: t),
      () => empty,
    );
  }
}

class _Item extends ConsumerWidget {
  const _Item({Key? key, required this.data}) : super(key: key);

  final Tran data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
