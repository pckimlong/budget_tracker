import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/presentation/widgets/my_box.dart';
import 'package:budget_tracker/src/providers/setting_providers.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../exports.dart';
import '../../../common_providers.dart';
import '../splash/splash_page.dart';

class SettingDialog extends ConsumerWidget {
  const SettingDialog({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const SettingDialog(),
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      SettingProviders.update,
      (previous, next) {
        if (previous?.isLoading == false && next.isLoading) {
          EasyLoading.show(status: 'Updating...');
        }
        if (previous?.isLoading == true && !next.isLoading) {
          EasyLoading.dismiss();
        }
      },
    );

    return ContentDialog(
      title: Row(
        children: [
          const Expanded(child: Text('ការកំណត់')),
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _ThemeMode(),
          SizedBox(height: 20),
          _AppColors(),
          SizedBox(height: 100),
          // _ChangePassword(),
          Align(alignment: Alignment.centerRight, child: _SignOut()),
        ],
      ),
    );
  }
}

class _SignOut extends ConsumerWidget {
  const _SignOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      child: const Text("Sign out"),
      onPressed: () async {
        final nav = Navigator.of(context);
        try {
          EasyLoading.show();
          await ref.read(firebaseAuthProvider).signOut();
          EasyLoading.dismiss();
          EasyLoading.showToast('Signed out',
              toastPosition: EasyLoadingToastPosition.bottom);
          nav.push(FluentPageRoute(builder: (_) => const SplashPage()));
        } catch (e) {
          EasyLoading.showError(e.toString());
        }
      },
    );
  }
}

class _ChangePassword extends HookConsumerWidget {
  const _ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final oldPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final cfNewPasswordController = useTextEditingController();

    return MyBox(
      padding: const EdgeInsets.all(16),
      child: InfoLabel(
        label: 'ប្ដូរពាក្យសម្ងាត់',
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormBox(
                controller: oldPasswordController,
                placeholder: 'Old password',
                obscureText: true,
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              TextFormBox(
                controller: newPasswordController,
                placeholder: 'New password',
                obscureText: true,
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 12),
              TextFormBox(
                controller: cfNewPasswordController,
                placeholder: 'Confirm new password',
                obscureText: true,
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  child: const Text('ផ្លាស់ប្តូរ'),
                  onPressed: () {
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate()) {}
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeMode extends ConsumerWidget {
  const _ThemeMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ToggleSwitch(
      checked: context.theme.brightness == Brightness.dark,
      onChanged: (state) {
        ref.read(SettingProviders.update.notifier).updateCopyWith((oldSetting) =>
            oldSetting.copyWith(themeMode: state ? ThemeMode.dark : ThemeMode.light));
      },
      content: const Text('ប្រើប្រាស់ផ្ទៃងងឹត'),
    );
  }
}

class _AppColors extends ConsumerWidget {
  const _AppColors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(Colors.accentColors.length, (index) {
        final color = Colors.accentColors[index];
        final selected = context.theme.accentColor == color;

        return GestureDetector(
          onTap: () => ref.read(SettingProviders.update.notifier).updateCopyWith(
              (oldSetting) => oldSetting.copyWith(appAccentColorIndex: index)),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: selected
                ? const Icon(
                    FluentIcons.check_mark,
                    color: Colors.white,
                    size: 26,
                  )
                : null,
          ),
        );
      }).toList(),
    );
  }
}
