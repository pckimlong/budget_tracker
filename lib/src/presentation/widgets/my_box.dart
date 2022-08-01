import 'package:fluent_ui/fluent_ui.dart';

class MyBox extends StatelessWidget {
  const MyBox({
    Key? key,
    this.onTap,
    this.child,
    this.padding = const EdgeInsets.all(10),
    this.margin,
    this.height,
    this.width,
    this.borderColor,
    this.backgroundColor,
    this.hasBorder = true,
  }) : super(key: key);

  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: hasBorder
              ? Border.all(
                  color:
                      borderColor ?? FluentTheme.of(context).borderInputColor,
                )
              : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: child,
      ),
    );
  }
}
