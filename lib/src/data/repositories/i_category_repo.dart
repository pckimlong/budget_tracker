import 'package:budget_tracker/src/common_providers.dart';
import 'package:budget_tracker/src/core/app_failure.dart';
import 'package:budget_tracker/src/data/firebase/error_handling.dart';
import 'package:budget_tracker/src/data/firebase/firebase_datasource.dart';
import 'package:budget_tracker/src/data/model/category.dart';

import '../../../exports.dart';

final categoryRepoProvider = Provider<ICategoryRepo>((ref) {
  return _Impl(ref.watch(datasourceProvider));
});

abstract class ICategoryRepo {
  Stream<Either<Failure, IList<Category>>> watchAll();
  Future<Either<Failure, Unit>> create(Category model);
  Future<Either<Failure, Unit>> update(Category model);
  Future<Either<Failure, Unit>> delete(CategoryId id);
}

class _Impl implements ICategoryRepo {
  final FirebaseDatasource _datasource;

  _Impl(this._datasource);

  @override
  Future<Either<Failure, Unit>> create(Category model) async {
    return await errorHandler(() async {
      await _datasource.createCategory(model);
      return right(unit);
    });
  }

  @override
  Future<Either<Failure, Unit>> delete(CategoryId id) async {
    return await errorHandler(() async {
      await _datasource.deleteCategory(id);
      return right(unit);
    });
  }

  @override
  Stream<Either<Failure, IList<Category>>> watchAll() {
    return _datasource.streamAllCategory().onErrorReturnFailure();
  }

  @override
  Future<Either<Failure, Unit>> update(Category model) async {
    return await errorHandler(() async {
      await _datasource.updateCategory(model);
      return right(unit);
    });
  }
}
