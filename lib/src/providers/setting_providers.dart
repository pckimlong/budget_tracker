import 'package:budget_tracker/src/data/repositories/i_account_repo.dart';
import 'package:budget_tracker/src/providers/account_providers.dart';

import '../../exports.dart';
import '../data/model/setting.dart';

class SettingProviders {
  const SettingProviders._();

  static final appColor = Provider<AccentColor>((ref) {
    final index = ref.watch(setting.select((value) => value.appAccentColorIndex));
    return Colors.accentColors.getOrNull(index) ?? Colors.blue;
  });

  static final setting = Provider<Setting>((ref) {
    return ref.watch(
      AccountProviders.stream.select(
        (value) => value.valueOrNull?.setting ?? const Setting(),
      ),
    );
  });

  static final update =
      StateNotifierProvider.autoDispose<UpdateSettingNotifier, AsyncValue<void>>((ref) {
    final value = ref.watch(setting);
    return UpdateSettingNotifier(ref.read, setting: value);
  });
}

class UpdateSettingNotifier extends StateNotifier<AsyncValue<void>> {
  UpdateSettingNotifier(
    this._reader, {
    required this.setting,
  }) : super(const AsyncValue.data(null));
  final Reader _reader;
  final Setting setting;

  Future<void> updateCopyWith(
      Setting Function(Setting oldSetting) copyWithBuilder) async {
    if (state.isLoading) return;

    state = const AsyncValue.loading();
    final result =
        await _reader(accountRepoProvider).updateSetting(copyWithBuilder(setting));

    if (!mounted) return;
    state = result.fold(AsyncValue.error, (r) => const AsyncValue.data(null));
  }
}
