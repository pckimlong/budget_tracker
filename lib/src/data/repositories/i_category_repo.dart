import 'package:budget_tracker/src/common_providers.dart';
import 'package:budget_tracker/src/core/app_failure.dart';
import 'package:budget_tracker/src/data/model/category.dart';

import '../../../exports.dart';

final categoryRepoProvider = Provider<ICategoryRepo>((ref) {
  return _Impl(ref.watch(supabaseClientProvider));
});

abstract class ICategoryRepo {
  Stream<Either<Failure, IList<Category>>> watchAll();
  Future<Either<Failure, Unit>> create(Category model);
  Future<Either<Failure, Unit>> update(Category model);
  Future<Either<Failure, Unit>> delete(CategoryId id);
}

class _Impl implements ICategoryRepo {
  final SupabaseClient _client;

  _Impl(this._client);

  @override
  Future<Either<Failure, Unit>> create(Category model) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> delete(CategoryId id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> update(Category model) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, IList<Category>>> watchAll() {
    // TODO: implement watchAll
    throw UnimplementedError();
  }
}
