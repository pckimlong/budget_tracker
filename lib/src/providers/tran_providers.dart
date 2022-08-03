import 'package:budget_tracker/src/core/app_failure.dart';
import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:budget_tracker/src/data/repositories/i_tran_repo.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/home/home_page.dart';
import 'package:budget_tracker/src/providers/category_providers.dart';
import 'package:budget_tracker/src/providers/tran_list_provider.dart';

import '../../exports.dart';
part "tran_providers.freezed.dart";

@freezed
class TranWithBalance with _$TranWithBalance {
  factory TranWithBalance({
    required Tran tran,
    required double balance,
  }) = _TranWithBalance;
}

class TranProviders {
  const TranProviders._();

  static final ofId =
      FutureProvider.autoDispose.family<Tran, TranId>((ref, tranId) async {
    final result = await ref.watch(tranRepoProvider).findOne(tranId);
    return result.fold((l) => throw l, id);
  });

  static final update = StateNotifierProvider.autoDispose
      .family<UpdateTranNotifier, AsyncValue<bool>, TranId>((ref, id) {
    return UpdateTranNotifier(ref.read, tranId: id);
  });

  static final updateData = StateNotifierProvider.autoDispose
      .family<UpdateTranDataNotifier, AsyncValue<Tran>, TranId>((ref, id) {
    final data = ref.watch(ofId(id));
    return UpdateTranDataNotifier(data);
  });

  static final delete = StateNotifierProvider.autoDispose
      .family<DeleteTranNotifier, AsyncValue<bool>, TranId>((ref, id) {
    return DeleteTranNotifier(ref.read, toDeleteId: id);
  });

  static final add =
      StateNotifierProvider.autoDispose<AddTranNotifier, AsyncValue<bool>>((ref) {
    return AddTranNotifier(ref.read);
  });
  static final addData =
      StateNotifierProvider.autoDispose<AddTranDataNotifier, Tran>((ref) {
    return AddTranDataNotifier(ref.read);
  });

  static final ofDate =
      StreamProvider.autoDispose.family<IList<Tran>, DateTime>((ref, date) {
    return ref
        .watch(tranRepoProvider)
        .watchAllByDate(date)
        .map((event) => event.fold((l) => throw l, id));
  });

  static final totalRemainingOfDate =
      Provider.autoDispose.family<AsyncValue<double>, DateTime>((ref, date) {
    final income = ref.watch(totalIncomeOfDate(date));
    final expense = ref.watch(totalExpenseOfDate(date));
    if (!income.hasValue || !expense.hasValue) {
      return const AsyncValue.loading();
    }
    return AsyncValue.data(income.value! - expense.value!);
  });

  static final totalIncomeOfDate =
      Provider.autoDispose.family<AsyncValue<double>, DateTime>((ref, date) {
    final incomeCategoryIds = ref.watch(
      CategoryProviders.ofType(CategoryType.income).select(
        (value) => value.whenData(
          (value) => value.map((e) => e.id!).toList(),
        ),
      ),
    );

    if (!incomeCategoryIds.hasValue) return const AsyncValue.loading();
    final categoryIds = incomeCategoryIds.valueOrNull ?? [];

    return ref.watch(ofDate(date)).whenData(
      (value) {
        final incomeTrans = value.where((e) => categoryIds.contains(e.categoryId));
        return incomeTrans.fold<double>(0, (pre, e) => pre + e.amount);
      },
    );
  });

  static final totalExpenseOfDate =
      Provider.autoDispose.family<AsyncValue<double>, DateTime>((ref, date) {
    final expenseCategoryIds = ref.watch(
      CategoryProviders.ofType(CategoryType.expense).select(
        (value) => value.whenData(
          (value) => value.map((e) => e.id!).toList(),
        ),
      ),
    );

    if (!expenseCategoryIds.hasValue) return const AsyncValue.loading();
    final categoryIds = expenseCategoryIds.valueOrNull ?? [];

    return ref.watch(ofDate(date)).whenData(
      (value) {
        final incomeTrans = value.where((e) => categoryIds.contains(e.categoryId));
        return incomeTrans.fold<double>(0, (pre, e) => pre + e.amount);
      },
    );
  });
}

class UpdateTranNotifier extends StateNotifier<AsyncValue<bool>> {
  UpdateTranNotifier(
    this._reader, {
    required this.tranId,
  }) : super(const AsyncValue.data(false));
  final Reader _reader;
  final TranId tranId;

  Future<void> call() async {
    if (state.isLoading || state == const AsyncValue.data(true)) {
      return;
    }

    final data = await _reader(TranProviders.updateData(tranId).future);
    _validatingData(data);

    if (state.hasError) return;

    state = const AsyncValue.loading();
    final result = await _reader(tranRepoProvider).update(data);
    state = result.fold(
      AsyncValue.error,
      (updated) {
        _reader(TranListProvider.pagination.notifier).updateItem(updated);
        return const AsyncValue.data(true);
      },
    );
  }

  void _validatingData(Tran data) {
    if (data.amount <= 0) {
      state =
          const AsyncValue.error(Failure.invalidValue('Amount must greater than 0'));
    } else if (data.categoryId.isNullOrBlank) {
      state = const AsyncValue.error(Failure.invalidValue('Must select a category'));
    }
  }
}

class UpdateTranDataNotifier extends StateNotifier<AsyncValue<Tran>> {
  UpdateTranDataNotifier(AsyncValue<Tran> initialState) : super(initialState);

  void onCategoryChanged(CategoryId newCategoryId) {
    if (!mounted) return;
    state = state.whenData((value) => value.copyWith(categoryId: newCategoryId));
  }

  void onAmountChanged(double amount) {
    if (!mounted) return;
    state = state.whenData((value) => value.copyWith(amount: amount));
  }

  void onDateChanged(DateTime newDate) {
    if (!mounted) return;
    state = state.whenData((value) => value.copyWith(date: newDate));
  }

  void onNoteChanged(String? newNote) {
    if (!mounted) return;
    state = state.whenData((value) => value.copyWith(note: newNote ?? ""));
  }
}

class DeleteTranNotifier extends StateNotifier<AsyncValue<bool>> {
  DeleteTranNotifier(this._reader, {required this.toDeleteId})
      : super(const AsyncValue.data(false));

  final Reader _reader;
  final TranId toDeleteId;

  Future<void> call() async {
    if (state.isLoading || state == const AsyncValue.data(true)) {
      return;
    }

    state = const AsyncValue.loading();
    final result = await _reader(tranRepoProvider).delete(toDeleteId);
    state = result.fold(
      AsyncValue.error,
      (_) {
        _reader(TranListProvider.pagination.notifier).deleteItem(toDeleteId);
        return const AsyncValue.data(true);
      },
    );
  }
}

class AddTranNotifier extends StateNotifier<AsyncValue<bool>> {
  AddTranNotifier(this._reader) : super(const AsyncValue.data(false));
  final Reader _reader;

  Future<void> call() async {
    if (state.isLoading || state == const AsyncValue.data(true)) {
      return;
    }

    final data = _reader(TranProviders.addData);
    _validatingData(data);

    if (state.hasError) return;

    state = const AsyncValue.loading();
    final result = await _reader(tranRepoProvider).create(data);
    state = result.fold(AsyncValue.error, (_) => const AsyncValue.data(true));
  }

  void _validatingData(Tran data) {
    if (data.amount <= 0) {
      state =
          const AsyncValue.error(Failure.invalidValue('Amount must greater than 0'));
    } else if (data.categoryId.isNullOrBlank) {
      state = const AsyncValue.error(Failure.invalidValue('Must select a category'));
    }
  }
}

class AddTranDataNotifier extends StateNotifier<Tran> {
  AddTranDataNotifier(Reader reader)
      : super(
          Tran(
            categoryId: "",
            date: reader(HomePage.dateFilter),
            amount: 0,
          ),
        );

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
