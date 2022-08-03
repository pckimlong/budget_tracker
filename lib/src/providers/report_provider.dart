import 'package:budget_tracker/src/data/repositories/i_tran_repo.dart';
import 'package:budget_tracker/src/providers/category_providers.dart';

import '../../exports.dart';
import '../data/model/category.dart';
import '../data/model/tran.dart';

class ReportProvider {
  const ReportProvider._();

  static final startDate = StateProvider<DateTime>((ref) {
    return DateTime.now().firstDayOfMonth;
  });

  static final endDate = StateProvider<DateTime>((ref) {
    return DateTime.now().lastDayOfMonth;
  });

  static final ofDateRange = FutureProvider.autoDispose<IList<Tran>>((ref) async {
    final start = ref.watch(startDate);
    final end = ref.watch(endDate);
    return ref
        .watch(tranRepoProvider)
        .findAllByDateRange(startDate: start, endDate: end)
        .then((value) => value.fold((l) => throw l, id));
  });

  static final totalRemaining = Provider.autoDispose<AsyncValue<double>>((ref) {
    final income = ref.watch(totalIncome);
    final expense = ref.watch(totalExpense);

    if (!income.hasValue || !expense.hasValue) return const AsyncValue.loading();

    return AsyncValue.data(income.value! - expense.value!);
  });

  static final totalOfCategory =
      Provider.autoDispose.family<AsyncValue<double>, String>((ref, cateId) {
    return ref.watch(ofDateRange).whenData((trans) {
      final filtered = trans.where((e) => e.categoryId == cateId);
      return filtered.fold<double>(0, (pre, e) => pre + e.amount);
    });
  });

  static final totalIncome = Provider.autoDispose<AsyncValue<double>>((ref) {
    final incomeCategoryIds = ref.watch(
      CategoryProviders.ofType(CategoryType.income).select(
        (value) => value.whenData(
          (value) => value.map((e) => e.id!).toList(),
        ),
      ),
    );

    if (!incomeCategoryIds.hasValue) {
      return const AsyncValue.loading();
    }
    final incomeCateIds = incomeCategoryIds.valueOrNull ?? [];
    return ref.watch(ofDateRange).whenData((trans) {
      final incomeTrans = trans.where((e) => incomeCateIds.contains(e.categoryId));
      return incomeTrans.fold<double>(0, (pre, e) => pre + e.amount);
    });
  });
  static final totalExpense = Provider.autoDispose<AsyncValue<double>>((ref) {
    final expenseCategoryIds = ref.watch(
      CategoryProviders.ofType(CategoryType.expense).select(
        (value) => value.whenData(
          (value) => value.map((e) => e.id!).toList(),
        ),
      ),
    );

    if (!expenseCategoryIds.hasValue) {
      return const AsyncValue.loading();
    }
    final expenseCateIds = expenseCategoryIds.valueOrNull ?? [];
    return ref.watch(ofDateRange).whenData((trans) {
      final expense = trans.where((e) => expenseCateIds.contains(e.categoryId));
      return expense.fold<double>(0, (pre, e) => pre + e.amount);
    });
  });

  static final totalOfDate =
      Provider.autoDispose.family<AsyncValue<double>, DateTime>((ref, date) {
    final expenseCategoryIds = ref.watch(
      CategoryProviders.ofType(CategoryType.expense).select(
        (value) => value.whenData(
          (value) => value.map((e) => e.id!).toList(),
        ),
      ),
    );
    final incomeCategoryIds = ref.watch(
      CategoryProviders.ofType(CategoryType.income).select(
        (value) => value.whenData(
          (value) => value.map((e) => e.id!).toList(),
        ),
      ),
    );

    if (!expenseCategoryIds.hasValue || !incomeCategoryIds.hasValue) {
      return const AsyncValue.loading();
    }
    final incomeCateIds = incomeCategoryIds.valueOrNull ?? [];
    final expenseCateIds = expenseCategoryIds.valueOrNull ?? [];

    return ref.watch(ofDateRange).whenData(
      (trans) {
        final incomeTrans = trans.where((e) =>
            incomeCateIds.contains(e.categoryId) && e.date.eqvYearMonthDay(date));
        final totalIncome = incomeTrans.fold<double>(0, (pre, e) => pre + e.amount);

        final expenseTrans = trans.where((e) =>
            expenseCateIds.contains(e.categoryId) && e.date.eqvYearMonthDay(date));
        final totalExpense = expenseTrans.fold<double>(0, (pre, e) => pre + e.amount);

        return totalIncome - totalExpense;
      },
    );
  });

  static final ofIndex =
      Provider.autoDispose.family<AsyncValue<Tran>, int>((ref, index) {
    return ref.watch(ofDateRange).whenData((value) => value[index]);
  });
}
