// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:flutter/material.dart';

class SelectableItem extends StatelessWidget {
  const SelectableItem({
    Key? key,
    this.onTap,
    required this.isSelected,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.isEndIndicator = true,
  }) : super(key: key);

  final VoidCallback? onTap;
  final bool isSelected;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final bool isEndIndicator;

  @override
  Widget build(BuildContext context) {
    final indicator = [
      Container(
        key: const ValueKey('indicator'),
        width: 5,
        height: 20,
        decoration: isSelected
            ? BoxDecoration(
                color: context.theme.accentColor,
                borderRadius: BorderRadius.circular(10),
              )
            : null,
      ),
      const SizedBox(width: 8),
    ];

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          
          width: width,
          height: height,
          padding: padding,
          margin: margin,
          decoration: isSelected
              ? BoxDecoration(
                  color: context.theme.inactiveBackgroundColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                )
              : null,
          child: Row(
            children: [
              const SizedBox(width: 8),
              // if (isEndIndicator == false) ...indicator,
              Expanded(child: child),
              const SizedBox(width: 8),
              // if (isEndIndicator) ...indicator,
            ],
          ),
        ),
      ),
    );
  }
}
