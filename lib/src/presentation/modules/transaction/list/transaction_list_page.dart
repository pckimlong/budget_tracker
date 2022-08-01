import '../../../../../exports.dart';

class TransactionListPage extends ConsumerWidget {
  const TransactionListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ScaffoldPage(
      header: PageHeader(
        title: Text('ប្រវត្តិចំណូលចំណាយ'),
      ),
    );
  }
}
