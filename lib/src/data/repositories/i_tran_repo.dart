import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/src/common_providers.dart';
import 'package:budget_tracker/src/core/app_failure.dart';
import 'package:budget_tracker/src/data/firebase/firebase_datasource.dart';
import 'package:budget_tracker/src/data/model/tran.dart';

final tranRepoProvider = Provider<ITranRepo>((ref) {
  return _Impl(ref.watch(datasourceProvider));
});

abstract class ITranRepo {
  Future<Either<Failure, Tran>> create(Tran data);
  Future<Either<Failure, Tran>> update(Tran data);
  Future<Either<Failure, Tran>> delete(TranId id);
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
  Future<Either<Failure, Tran>> create(Tran data) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Tran>> delete(TranId id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IList<Tran>>> findAll(
      {required DateTime createdAt, int limit = 30}) {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IList<Tran>>> findAllByDateRange(
      {required DateTime startDate, required DateTime endDate}) {
    // TODO: implement findAllByDateRange
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Tran>> update(Tran data) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, IList<Tran>>> watchAllByDate(DateTime date) {
    // TODO: implement watchAllByDate
    throw UnimplementedError();
  }
}
