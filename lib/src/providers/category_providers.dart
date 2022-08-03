import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/src/core/app_failure.dart';
import 'package:budget_tracker/src/data/model/category.dart';

import '../data/model/tran.dart';
import '../data/repositories/i_category_repo.dart';

class CategoryProviders {
  const CategoryProviders._();

  static final add =
      StateNotifierProvider.autoDispose<AddCategoryNotifier, AsyncValue<bool>>((ref) {
    return AddCategoryNotifier(ref.read);
  });

  static final idsOfType = Provider.autoDispose
      .family<AsyncValue<IList<CategoryId>>, CategoryType>((ref, type) {
    return ref.watch(streamAll).whenData((value) =>
        value.where((element) => element.type == type).map((e) => e.id!).toIList());
  });

  static final ofId =
      Provider.autoDispose.family<AsyncValue<Category?>, CategoryId?>((ref, id) {
    if (id == null) return const AsyncValue.data(null);
    return ref
        .watch(streamAll)
        .whenData((value) => value.firstOrNullWhere((element) => element.id == id));
  });

  static final ofType = Provider.autoDispose
      .family<AsyncValue<IList<Category>>, CategoryType>((ref, type) {
    return ref
        .watch(streamAll)
        .whenData((value) => value.where((element) => element.type == type).toIList());
  });

  static final streamAll = StreamProvider<IList<Category>>((ref) {
    return ref
        .watch(categoryRepoProvider)
        .watchAll()
        .map((event) => event.fold((l) => throw l, id));
  });

  static final update = StateNotifierProvider.autoDispose
      .family<UpdateCategoryNotifier, AsyncValue<bool>, CategoryId>((ref, id) {
    return UpdateCategoryNotifier(ref.read, toUpdateId: id);
  });

  static final updateData = StateNotifierProvider.autoDispose
      .family<UpdateCategoryDataNotifier, AsyncValue<Category>, CategoryId>((ref, id) {
    return UpdateCategoryDataNotifier(ref.read, id: id);
  });
}

class AddCategoryNotifier extends StateNotifier<AsyncValue<bool>> {
  AddCategoryNotifier(this._reader) : super(const AsyncValue.data(false));

  final Reader _reader;

  Future<void> call(Category newCategory) async {
    assert(newCategory.id == null);

    if (state.isLoading || state == const AsyncValue.data(true)) return;

    if (newCategory.name.isBlank) {
      state = const AsyncValue.error(
          Failure.invalidValue('ឈ្មោះប្រភេទចំណូលចំណាយមិនអាចទទេបានទេ'));
      return;
    }

    state = const AsyncValue.loading();
    final result = await _reader(categoryRepoProvider).create(newCategory);
    state = result.fold(AsyncValue.error, (_) => const AsyncValue.data(true));
  }
}

class UpdateCategoryDataNotifier extends StateNotifier<AsyncValue<Category>> {
  UpdateCategoryDataNotifier(
    this._reader, {
    required this.id,
  }) : super(const AsyncValue.loading()) {
    _fetchData();
  }

  final CategoryId id;

  final Reader _reader;

  void onNameChanged(String newName) {
    state = state.whenData((value) => value.copyWith(name: newName));
  }

  Future<void> _fetchData() async {
    try {
      final result = await _reader(CategoryProviders.ofId(id).future);
      state = AsyncValue.data(result!);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}

class UpdateCategoryNotifier extends StateNotifier<AsyncValue<bool>> {
  UpdateCategoryNotifier(
    this._reader, {
    required this.toUpdateId,
  }) : super(const AsyncValue.data(false));

  final TranId toUpdateId;

  final Reader _reader;

  Future<void> call() async {
    if (state.isLoading || state == const AsyncValue.data(true)) return;

    final data = await _reader(CategoryProviders.updateData(toUpdateId).future);

    if (data.name.isBlank) {
      state = const AsyncValue.error(
          Failure.invalidValue('ឈ្មោះប្រភេទចំណូលចំណាយមិនអាចទទេបានទេ'));
      return;
    }

    state = const AsyncValue.loading();
    final result = await _reader(categoryRepoProvider).update(data);
    state = result.fold(AsyncValue.error, (_) => const AsyncValue.data(true));
  }
}
