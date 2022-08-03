import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/src/data/model/balance_adjustment_history.dart';
import 'package:budget_tracker/src/data/repositories/i_balance_repo.dart';

class BalanceProviders {
  const BalanceProviders._();

  static final adjust =
      StateNotifierProvider.autoDispose<AdjustBalanceNotifier, AsyncValue<bool>>((ref) {
    return AdjustBalanceNotifier(ref.read);
  });

  static final histories =
      StreamProvider.autoDispose<IList<BalanceAdjustmentHistory>>((ref) {
    return ref
        .watch(balanceRepoProvider)
        .streamAllHistory()
        .map((event) => event.fold((l) => throw l, id));
  });
}

class AdjustBalanceNotifier extends StateNotifier<AsyncValue<bool>> {
  AdjustBalanceNotifier(this._reader) : super(const AsyncValue.data(false));

  final Reader _reader;

  Future<void> call({required double newBalance}) async {
    if (state.isLoading || state == const AsyncValue.data(true)) {
      return;
    }

    state = const AsyncValue.loading();
    final result =
        await _reader(balanceRepoProvider).adjustBalance(newBalance: newBalance);
    state = result.fold(AsyncValue.error, (_) => const AsyncValue.data(true));
  }
}
