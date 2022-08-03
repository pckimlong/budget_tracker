import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:budget_tracker/src/data/repositories/i_tran_repo.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/add/add_transaction_dialog.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/home/home_page.dart';
import 'package:budget_tracker/src/providers/category_providers.dart';

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
  AddTranDataNotifier(Reader reader)
      : super(Tran(
          categoryId: reader(AddTransactionDialog.initialCategoryIdProvider),
          date: reader(HomePage.dateFilter),
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
