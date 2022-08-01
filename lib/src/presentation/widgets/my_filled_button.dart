import 'package:budget_tracker/src/core/app_style.dart';

import '../../../exports.dart';

class MyFilledButton extends ConsumerWidget {
  const MyFilledButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.backgroundColor,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: AS.buttonHeight,
      child: FilledButton(
        style: backgroundColor != null
            ? ButtonStyle(backgroundColor: ButtonState.all(backgroundColor))
            : null,
        onPressed: onPressed,
        child: Center(child: child),
      ),
    );
  }
}
