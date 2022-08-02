import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/src/common_providers.dart';
import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/core/app_failure.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:budget_tracker/src/providers/auth_providers.dart';

final tranRepoProvider = Provider<ITranRepo>((ref) {
  return _Impl(
    ref.watch(supabaseClientProvider),
    ref.watch(AuthProviders.uuid),
  );
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

const _table = "transactions";

class _Impl implements ITranRepo {
  final SupabaseClient _client;

  _Impl(this._client, this._uuid);
  final String? _uuid;

  @override
  Future<Either<Failure, Tran>> create(Tran data) async {
    if (_uuid == null) return left(const Failure.unauthorized());

    final res = await _client.from(_table).insert({
      Tran.amountKey: data.amount,
      Tran.categoryIdKey: data.categoryId,
      Tran.dateKey: data.date.supabaseDateOnly(),
      Tran.noteKey: data.note,
      'user_id': _uuid,
    }).execute();

    if (res.hasError) {
      return left(Failure.exception(res.error?.message));
    }
    return right(data);
  }

  @override
  Future<Either<Failure, Unit>> delete(TranId id) {
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
  Future<Either<Failure, double>> getOpeningBalanceOfDate(DateTime date) {
    // TODO: implement getOpeningBalanceOfDate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Tran>> update(Tran data) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, IList<Tran>>> watchAllByDate(DateTime date) {
    if (_uuid == null) return Stream.value(left(const Failure.unauthorized()));

    return _client
        .from(
          "transaction_details"
          ":date=eq.'${date.supabaseDateOnly()}'",
        )
        .stream(['id'])
        .execute()
        .map((event) {
          final list = event.map((e) => Tran.fromJson(e)).toIList();
          return right<Failure, IList<Tran>>(list);
        });
  }
}
