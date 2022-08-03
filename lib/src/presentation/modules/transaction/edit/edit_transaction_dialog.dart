import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:budget_tracker/src/providers/tran_providers.dart';

import '../../../../../exports.dart';

class EditTransactionDialog extends ConsumerWidget {
  const EditTransactionDialog({
    Key? key,
    required this.id,
  }) : super(key: key);

  final TranId id;

  static void show(BuildContext context, {required TranId toUpdateId}) {
    showDialog(
      context: context,
      builder: (_) => EditTransactionDialog(id: toUpdateId),
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updatingDataState = ref.watch(TranProviders.updateData(id));

    return updatingDataState.when(
      data: (data) {
        return ProviderScope(
          overrides: [_initialDataProvider.overrideWithValue(data)],
          child: const _WhenData(),
        );
      },
      error: (err, _) => Center(child: Text(err.toString())),
      loading: () => const Center(child: ProgressRing()),
    );
  }
}

final _initialDataProvider = Provider<Tran>((ref) {
  throw UnimplementedError();
});

class _WhenData extends ConsumerWidget {
  const _WhenData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
