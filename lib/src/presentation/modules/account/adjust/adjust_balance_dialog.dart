import 'package:budget_tracker/src/core/app_helper.dart';
import 'package:budget_tracker/src/presentation/widgets/my_box.dart';
import 'package:budget_tracker/src/providers/account_providers.dart';
import 'package:budget_tracker/src/providers/balance_providers.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../exports.dart';
import '../../../../core/app_style.dart';
import '../../../widgets/my_filled_button.dart';
import 'package:budget_tracker/src/core/app_extensions.dart';

class AdjustBalanceDialog extends HookConsumerWidget {
  const AdjustBalanceDialog({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showDialog(context: context, builder: (_) => const AdjustBalanceDialog());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adjustState = ref.watch(BalanceProviders.adjust);
    final initialBalance =
        useMemoized(() => ref.read(AccountProviders.totalBalance).valueOrNull);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final controller = useTextEditingController(text: initialBalance?.toString());

    ref.listen<AsyncValue<bool>>(
      BalanceProviders.adjust,
      (previous, next) {
        if (previous?.isLoading == true && next == const AsyncValue.data(true)) {
          EasyLoading.showToast('បានកែប្រែដោយជោគជ័យ',
              toastPosition: EasyLoadingToastPosition.top);
          Navigator.pop(context);
        }
      },
    );

    return ContentDialog(
      title: const Text('កែទឹកប្រាក់សមតុល្យសរុប'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: formKey,
            child: TextFormBox(
              controller: controller,
              inputFormatters: inputFormatterNumeric,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.numeric(),
                FormBuilderValidators.required(),
              ]),
            ),
          ),
          if (adjustState.hasError) ...[
            const SizedBox(height: 10),
            InfoBar(
              title: Text(adjustState.error.toString()),
              severity: InfoBarSeverity.error,
            ),
          ],
          const SizedBox(height: 20),
          const _History(),
        ],
      ),
      actions: [
        MyFilledButton(
          onPressed: () async {
            formKey.currentState!.save();
            if (formKey.currentState!.validate()) {
              final adjust = ref.read(BalanceProviders.adjust.notifier);
              await adjust(newBalance: controller.text.toDouble());
            }
          },
          child: adjustState.isLoading
              ? const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: ProgressRing(),
                  ),
                )
              : const Text('រក្សាទុក'),
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

class _History extends ConsumerWidget {
  const _History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(BalanceProviders.histories);

    return MyBox(
      child: SizedBox(
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('ប្រវត្តិនៃការកែមុនៗ'),
            Expanded(
              child: historyAsync.when(
                data: (items) {
                  if (items.isEmpty) {
                    return const Center(child: Text('ពុំមានទិន្នន័យ'));
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemBuilder: (_, index) {
                      final data = items[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.date?.format(false) ?? "",
                            ),
                            Row(
                              children: [
                                Text(data.oldBalance?.moneyFormat() ?? ""),
                                const SizedBox(width: 10),
                                const Icon(Icons.arrow_forward),
                                const SizedBox(width: 10),
                                Text(data.newBalance.moneyFormat()),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const Divider(),
                  );
                },
                error: (err, __) => Center(child: Text(err.toString())),
                loading: () => const Center(child: ProgressRing()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
