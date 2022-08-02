import 'package:budget_tracker/src/common_providers.dart';
import 'package:budget_tracker/src/core/app_failure.dart';
import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/providers/auth_providers.dart';
import 'package:rxdart/rxdart.dart';

import '../../../exports.dart';

final categoryRepoProvider = Provider<ICategoryRepo>((ref) {
  return _Impl(
    ref.watch(supabaseClientProvider),
    ref.watch(AuthProviders.uuid),
  );
});

abstract class ICategoryRepo {
  Stream<Either<Failure, IList<Category>>> watchAll();
  Future<Either<Failure, Unit>> create(Category model);
  Future<Either<Failure, Unit>> update(Category model);
  Future<Either<Failure, Unit>> delete(CategoryId id);
}

const _table = "categories";

class _Impl implements ICategoryRepo {
  final SupabaseClient _client;
  final String? _uuid;

  _Impl(this._client, this._uuid);

  @override
  Future<Either<Failure, Unit>> create(Category model) async {
    if (_uuid == null) return left(const Failure.unauthorized());

    final res = await _client.from(_table).insert({
      Category.nameKey: model.name,
      Category.typeKey: model.type.name,
      'user_id': _uuid,
    }).execute();

    if (res.hasError) {
      return left(Failure.exception(res.error?.message));
    }
    return right(unit);
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
    if (_uuid == null) return Stream.value(left(const Failure.unauthorized()));

    final stream = _client.from("categories").stream(["id"]);
    return stream.execute().map(
      (event) {
        final list = event.map((e) => Category.fromJson(e)).toIList();
        return right<Failure, IList<Category>>(list);
      },
    ).onErrorReturnWith((error, stackTrace) =>
        left<Failure, IList<Category>>(Failure.exception(error.toString())));
  }
}
