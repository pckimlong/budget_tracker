import 'package:budget_tracker/main.dart';
import 'package:budget_tracker/src/common_providers.dart';
import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/presentation/modules/account/adjust/adjust_balance_dialog.dart';
import 'package:budget_tracker/src/presentation/modules/splash/splash_page.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/home/home_page.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/list/transaction_list_page.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/report/report_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

import '../../../exports.dart';
import '../../providers/account_providers.dart';

class RootPage extends HookConsumerWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState<int>(0);

    return NavigationView(
      content: NavigationBody(
        index: currentIndex.value,
        children: const [
          HomePage(),
          TransactionListPage(),
          ReportPage(),
        ],
      ),
      pane: NavigationPane(
        displayMode: PaneDisplayMode.open,
        selected: currentIndex.value,
        onChanged: (value) => currentIndex.value = value,
        items: [
          PaneItemHeader(
            header: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(8.0),
              child: const _AccountBalance(),
            ),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.home),
            title: const Text('ទំព័រដើម'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.list),
            title: const Text('ប្រវត្តិចំណូលចំណាយ'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.report_document),
            title: const Text('របាយការណ៍'),
          ),
        ],
        footerItems: [
          PaneItemAction(
            icon: const Icon(FluentIcons.sign_out),
            title: const Text('LOGOUT'),
            onTap: () async {
              final nav = Navigator.of(context);
              try {
                await ref.read(firebaseAuthProvider).signOut();
                nav.push(FluentPageRoute(builder: (_) => const SplashPage()));
              } catch (e) {
                EasyLoading.showError(e.toString());
              }
            },
          ),
          PaneItemHeader(
            header: DefaultTextStyle(
              style: context.theme.typography.caption!,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Version $appVersion'),
                    Text('Powered by Kimapp'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountBalance extends ConsumerWidget {
  const _AccountBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalBalance = ref.watch(AccountProviders.totalBalance);

    return Row(
      children: [
        Expanded(
          child: InfoLabel(
            label: 'សមតុល្យសរុប',
            child: totalBalance.when(
              data: (balance) {
                final formatter = NumberFormat.currency(symbol: "\$ ");

                return FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    formatter.format(balance),
                    style: context.theme.typography.title!.copyWith(
                      height: 1,
                    ),
                  ),
                );
              },
              error: (err, _) => Text(
                err.toString(),
                style: TextStyle(color: Colors.red),
              ),
              loading: () => const ProgressBar(),
            ),
          ),
        ),
        Tooltip(
          message: 'កែប្រែសមតុល្យសរុប',
          child: IconButton(
            icon: const Icon(FluentIcons.edit),
            onPressed: () => AdjustBalanceDialog.show(context),
          ),
        ),
      ],
    );
  }
}
