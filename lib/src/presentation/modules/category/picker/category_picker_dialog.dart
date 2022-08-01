import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/presentation/modules/category/add/add_category_dialog.dart';
import 'package:budget_tracker/src/presentation/widgets/seletable_item.dart';
import 'package:budget_tracker/src/providers/category_providers.dart';

import '../../../../../exports.dart';
import '../../../widgets/my_filled_button.dart';

class CategoryPickerDialog extends ConsumerWidget {
  const CategoryPickerDialog({
    Key? key,
    required this.initial,
    required this.type,
  }) : super(key: key);

  static Future<CategoryId?> show(BuildContext context,
      {CategoryId? initial, required CategoryType type}) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => CategoryPickerDialog(
        initial: initial,
        type: type,
      ),
    );
  }

  final CategoryId? initial;
  final CategoryType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(CategoryProviders.idsOfType(type));

    return ContentDialog(
      title: Row(
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text('ជ្រើសរើសប្រភេទ${type.khmer()}'),
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            style: ButtonStyle(
              backgroundColor: ButtonState.all(Colors.grey),
              foregroundColor: ButtonState.all(Colors.white),
            ),
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      content: Column(
        children: [
          Expanded(
            child: listAsync.when(
              data: (categories) {
                if (categories.isEmpty) {
                  return const Center(child: Text('No record'));
                }

                return ListView.builder(
                  itemBuilder: (_, index) {
                    return ProviderScope(
                      overrides: [
                        _idProvider.overrideWithValue(categories[index]),
                        _typeProvider.overrideWithValue(type),
                        _selectedProvider.overrideWithValue(initial)
                      ],
                      child: const _Item(),
                    );
                  },
                  itemCount: categories.length,
                );
              },
              error: (err, _) => Center(child: Text(err.toString())),
              loading: () => const Center(child: ProgressRing()),
            ),
          ),
          const SizedBox(height: 10),
          MyFilledButton(
            onPressed: () => AddCategoryDialog.show(context, initialType: type),
            child: const Text('Add new'),
          ),
        ],
      ),
    );
  }
}

final _idProvider = Provider<CategoryId>((ref) {
  throw UnimplementedError();
});

final _typeProvider = Provider<CategoryType>((ref) {
  throw UnimplementedError();
});

final _selectedProvider = Provider<CategoryId?>((ref) {
  return;
});

class _Item extends ConsumerWidget {
  const _Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(_idProvider);
    final type = ref.watch(_typeProvider);
    final selected = id == ref.watch(_selectedProvider);
    final data = ref.watch(CategoryProviders.ofId(id));

    if (data.hasValue) {
      return SelectableItem(
        isSelected: selected,
        onTap: () => Navigator.pop(context, id),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              type == CategoryType.expense
                  ? Icon(FluentIcons.remove, color: Colors.red)
                  : Icon(FluentIcons.add, color: Colors.green),
              const SizedBox(width: 12),
              Text(data.valueOrNull!.name),
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
