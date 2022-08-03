import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/src/common_providers.dart';
import 'package:budget_tracker/src/core/app_failure.dart';
import 'package:budget_tracker/src/data/firebase/error_handling.dart';
import 'package:budget_tracker/src/data/firebase/firebase_datasource.dart';
import 'package:budget_tracker/src/data/model/account.dart';
import 'package:budget_tracker/src/data/model/setting.dart';

final accountRepoProvider = Provider<IAccountRepo>((ref) {
  return _Impl(ref.watch(datasourceProvider));
});

abstract class IAccountRepo {
  Stream<Either<Failure, Account>> watchOne();
  Future<Either<Failure, Unit>> updateSetting(Setting data);
}

class _Impl implements IAccountRepo {
  final FirebaseDatasource _datasource;

  _Impl(this._datasource);

  @override
  Stream<Either<Failure, Account>> watchOne() {
    return _datasource.watchAccount().onErrorReturnFailure();
  }

  @override
  Future<Either<Failure, Unit>> updateSetting(Setting data) async {
    return await errorHandler(() async {
      await _datasource.updateSetting(data);
      return right(unit);
    });
  }
}
