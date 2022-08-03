import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:budget_tracker/src/providers/tran_providers.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../exports.dart';
import '../../../../core/app_style.dart';
import '../../../widgets/my_filled_button.dart';

class DeleteTransactionDialog extends ConsumerWidget {
  const DeleteTransactionDialog({
    Key? key,
    required this.data,
  }) : super(key: key);

  static void show(BuildContext context, {required Tran toDelete}) {
    showDialog(
      context: context,
      builder: (_) => DeleteTransactionDialog(data: toDelete),
    );
  }

  final Tran data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deleteState = ref.watch(TranProviders.delete(data.id!));

    ref.listen<AsyncValue<bool>>(
      TranProviders.delete(data.id!),
      (previous, next) {
        if (previous?.isLoading == true && next == const AsyncValue.data(true)) {
          EasyLoading.showToast('បានលុប', toastPosition: EasyLoadingToastPosition.top);
          Navigator.pop(context);
        }
      },
    );

    return ContentDialog(
      title: const Text('ប្រាកដអត់ថាចងលុប?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'ទឹកប្រាក់ ${data.amount.moneyFormat()} នឹងត្រូវទូទាត់ចូលសមតុល្យសរុបវិញ'),
          if (deleteState.hasError) InfoBar(title: Text(deleteState.error.toString())),
        ],
      ),
      actions: [
        MyFilledButton(
          backgroundColor: Colors.red,
          child: deleteState.isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: ProgressRing(),
                )
              : const Text('លុប'),
          onPressed: () async {
            final delete = ref.read(TranProviders.delete(data.id!).notifier);
            await delete();
          },
        ),
        SizedBox(
          height: AS.buttonHeight,
          child: Button(
            child: const Text("ត្រលប់"),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
