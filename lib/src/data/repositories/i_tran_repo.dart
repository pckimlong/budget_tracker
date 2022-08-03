import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/src/common_providers.dart';
import 'package:budget_tracker/src/core/app_failure.dart';
import 'package:budget_tracker/src/data/firebase/error_handling.dart';
import 'package:budget_tracker/src/data/firebase/firebase_datasource.dart';
import 'package:budget_tracker/src/data/model/tran.dart';

final tranRepoProvider = Provider<ITranRepo>((ref) {
  return _Impl(ref.watch(datasourceProvider));
});

abstract class ITranRepo {
  Future<Either<Failure, Tran>> create(Tran data);
  Future<Either<Failure, Tran>> update(Tran data);
  Future<Either<Failure, Unit>> delete(TranId id);
  Future<Either<Failure, double>> getOpeningBalanceOfDate(DateTime date);
  Stream<Either<Failure, IList<Tran>>> watchAllByDate(DateTime date);
  Future<Either<Failure, IList<Tran>>> findAllByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  });
  Future<Either<Failure, IList<Tran>>> findAll({
    required DateTime createdAt,
    int limit = 30,
  });
}

class _Impl implements ITranRepo {
  final FirebaseDatasource _datasource;

  _Impl(this._datasource);

  @override
  Future<Either<Failure, Tran>> create(Tran data) async {
    return await errorHandler(() async {
      final id = await _datasource.createTran(data);
      return right(data.copyWith(id: id));
    });
  }

  @override
  Future<Either<Failure, Unit>> delete(TranId id) async {
    return await errorHandler(() async {
      await _datasource.deleteTran(id);
      return right(unit);
    });
  }

  @override
  Future<Either<Failure, IList<Tran>>> findAll(
      {required DateTime createdAt, int limit = 30}) {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IList<Tran>>> findAllByDateRange(
      {required DateTime startDate, required DateTime endDate}) async {
    return await errorHandler(() async {
      final result = await _datasource.fetchAllTranByDateRange(startDate, endDate);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, Tran>> update(Tran data) async {
    return await errorHandler(() async {
      await _datasource.updateTran(data);
      return right(data);
    });
  }

  @override
  Stream<Either<Failure, IList<Tran>>> watchAllByDate(DateTime date) {
    return _datasource.streamAllTranByDate(date).onErrorReturnFailure();
  }

  @override
  Future<Either<Failure, double>> getOpeningBalanceOfDate(DateTime date) {
    // TODO: implement getOpeningBalanceOfDate
    throw UnimplementedError();
  }
}
