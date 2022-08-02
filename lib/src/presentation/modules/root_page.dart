import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/presentation/modules/setting/setting_page.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/home/home_page.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/list/transaction_list_page.dart';
import 'package:budget_tracker/src/presentation/modules/transaction/report/report_page.dart';
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
          SettingPage(),
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
            title: const Text('ប្រតិបត្តិការចំណូលចំណាយ'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.report_document),
            title: const Text('របាយការណ៍'),
          ),
        ],
        footerItems: [
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('កំណត់'),
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

    return InfoLabel(
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
    );
  }
}
