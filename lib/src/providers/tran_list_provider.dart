import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:budget_tracker/src/data/repositories/i_tran_repo.dart';

import '../../exports.dart';

class TranListProvider {
  const TranListProvider._();

  static final categoryFilter = StateProvider<Category?>((ref) {
    return;
  });

  static final fetchingMore =
      StateNotifierProvider.autoDispose<TranFetchMoreNotifier, AsyncValue<void>>((ref) {
    final cateId = ref.watch(categoryFilter.select((value) => value?.id));
    return TranFetchMoreNotifier(ref.read, cateId);
  });

  static final pagination =
      StateNotifierProvider.autoDispose<TranListNotifier, IList<Tran>>((ref) {
    ref.watch(categoryFilter.select((value) => value?.id));
    return TranListNotifier(ref.read);
  });

  static final ofIndex = Provider.autoDispose.family<Option<Tran>, int>((ref, index) {
    final baseList = ref.watch(pagination);
    return Option.fromNullable(baseList.getOrNull(index));
  });
}

class TranListNotifier extends StateNotifier<IList<Tran>> {
  TranListNotifier(Reader reader) : super(const IListConst([]));

  void _appendItems(IList<Tran> newItems) {
    if (!mounted) return;

    state = state.addAll(newItems);
  }
}

class TranFetchMoreNotifier extends StateNotifier<AsyncValue<void>> {
  TranFetchMoreNotifier(this._reader, this._categoryId)
      : super(const AsyncValue.data(null)) {
    call();
  }

  final CategoryId? _categoryId;
  final Reader _reader;

  DateTime? _createdAtOffset;
  bool _hasMore = true;
  final _limit = 20;

  Future<void> call() async {
    if (state.isLoading && !_hasMore) return;

    state = const AsyncValue.loading();
    final result = await _reader(tranRepoProvider)
        .findAll(createdAt: _createdAtOffset, categoryId: _categoryId, limit: _limit);
    state = result.fold(
      AsyncValue.error,
      (tranList) {
        if (tranList.length < _limit) {
          _hasMore = false;
        } else {
          _hasMore = true;
        }
        if (tranList.isNotEmpty) {
          _createdAtOffset = tranList.last.createdAt;
          _reader(TranListProvider.pagination.notifier)._appendItems(tranList);
        }
        return const AsyncValue.data(null);
      },
    );
  }
}
