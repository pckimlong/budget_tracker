import 'package:budget_tracker/src/data/model/account.dart';
import 'package:budget_tracker/src/data/repositories/i_account_repo.dart';

import '../../exports.dart';

class AccountProviders {
  const AccountProviders._();

  static final totalBalance = Provider.autoDispose<AsyncValue<double>>((ref) {
    return ref.watch(stream).whenData((value) => value.totalBalance);
  });

  static final stream = StreamProvider<Account>((ref) {
    return ref
        .watch(accountRepoProvider)
        .watchOne()
        .map((event) => event.fold((l) => throw l, id));
  });
}
