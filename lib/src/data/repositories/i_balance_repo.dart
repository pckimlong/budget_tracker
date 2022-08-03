import 'package:budget_tracker/src/common_providers.dart';
import 'package:budget_tracker/src/data/firebase/error_handling.dart';
import 'package:budget_tracker/src/data/firebase/firebase_datasource.dart';
import 'package:budget_tracker/src/data/model/balance_adjustment_history.dart';

import '../../../exports.dart';
import '../../core/app_failure.dart';

final balanceRepoProvider = Provider<IBalanceRepo>((ref) {
  return _Impl(ref.watch(datasourceProvider));
});

abstract class IBalanceRepo {
  Future<Either<Failure, Unit>> adjustBalance({required double newBalance});
  Stream<Either<Failure, IList<BalanceAdjustmentHistory>>> streamAllHistory();
}

class _Impl implements IBalanceRepo {
  final FirebaseDatasource _datasource;

  _Impl(this._datasource);

  @override
  Future<Either<Failure, Unit>> adjustBalance({required double newBalance}) async {
    return await errorHandler(() async {
      await _datasource.adjustBalance(newBalance);
      return right(unit);
    });
  }

  @override
  Stream<Either<Failure, IList<BalanceAdjustmentHistory>>> streamAllHistory() {
    return _datasource.streamBalanceAdjustment().onErrorReturnFailure();
  }
}
