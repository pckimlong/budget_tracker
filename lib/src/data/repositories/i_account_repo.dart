import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/src/common_providers.dart';
import 'package:budget_tracker/src/core/app_failure.dart';
import 'package:budget_tracker/src/data/model/account.dart';

final accountRepoProvider = Provider<IAccountRepo>((ref) {
  return _Impl(ref.watch(supabaseClientProvider));
});

abstract class IAccountRepo {
  Stream<Either<Failure, Account>> watchOne();
  Future<Either<Failure, Unit>> update(Account data);
}

class _Impl implements IAccountRepo {
  final SupabaseClient _client;

  _Impl(this._client);

  @override
  Future<Either<Failure, Unit>> update(Account data) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, Account>> watchOne() {
    throw UnimplementedError();
  }
}
