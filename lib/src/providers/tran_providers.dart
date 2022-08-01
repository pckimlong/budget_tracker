import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:budget_tracker/src/data/repositories/i_tran_repo.dart';

import '../../exports.dart';

class TranProviders {
  const TranProviders._();

  static final add =
      StateNotifierProvider.autoDispose<AddTranNotifier, AsyncValue<bool>>((ref) {
    return AddTranNotifier(ref.read);
  });
  static final addData =
      StateNotifierProvider.autoDispose<AddTranDataNotifier, Tran>((ref) {
    return AddTranDataNotifier();
  });

  static final ofDate =
      StreamProvider.autoDispose.family<IList<Tran>, DateTime>((ref, date) {
    return ref
        .watch(tranRepoProvider)
        .watchAllByDate(date)
        .map((event) => event.fold((l) => throw l, id));
  });
}

class AddTranNotifier extends StateNotifier<AsyncValue<bool>> {
  AddTranNotifier(this._rader) : super(const AsyncValue.data(false));
  final Reader _rader;

  Future<void> call() async {
    if (state.isLoading || state == const AsyncValue.data(true)) {
      return;
    }

    final data = _rader(TranProviders.addData);
    _validatingData(data);

    state = const AsyncValue.loading();
    final result = await _rader(tranRepoProvider).create(data);
    state = result.fold(AsyncValue.error, (_) => const AsyncValue.data(true));
  }

  void _validatingData(Tran data) {}
}

class AddTranDataNotifier extends StateNotifier<Tran> {
  AddTranDataNotifier()
      : super(Tran(
          categoryId: '',
          date: DateTime.now(),
          amount: 0,
        ));

  void onCategoryChanged(CategoryId newCategoryId) {
    state = state.copyWith(categoryId: newCategoryId);
  }

  void onAmountChanged(double amount) {
    state = state.copyWith(amount: amount);
  }

  void onDateChanged(DateTime newDate) {
    state = state.copyWith(date: newDate);
  }

  void onNoteChanged(String? newNote) {
    state = state.copyWith(note: newNote ?? "");
  }
}
