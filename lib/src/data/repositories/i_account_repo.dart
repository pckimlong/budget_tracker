import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/src/common_providers.dart';
import 'package:budget_tracker/src/core/app_failure.dart';
import 'package:budget_tracker/src/data/model/account.dart';
import 'package:rxdart/rxdart.dart';

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
    final id = _client.auth.currentUser!.id;
    final stream = _client.from("accounts").stream([id]);
    return stream.execute().map(
      (event) {
        if (event.isEmpty) {
          return right<Failure, Account>(Account());
        }
        final map = event.first;
        final pass = Account.fromJson(map);
        return right<Failure, Account>(pass);
      },
    ).onErrorReturnWith((error, stackTrace) =>
        left<Failure, Account>(Failure.exception(error.toString())));
  }
}
