import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/core/app_style.dart';
import 'package:dartx/dartx.dart';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' hide TextButton, IconButton;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'my_box.dart';

class MyDatePicker extends HookConsumerWidget {
  const MyDatePicker({
    Key? key,
    required this.onDateChanged,
    required this.selectedDate,
    this.child,
    this.width,
    this.showNavigator = false,
  }) : super(key: key);

  final void Function(DateTime) onDateChanged;
  final DateTime? selectedDate;
  final Widget? child;
  final double? width;
  final bool showNavigator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = FluentTheme.of(context);
    final flyoutController = useMemoized(() => FlyoutController());
    final selected = selectedDate ?? DateTime.now();

    return Flyout(
      controller: flyoutController,
      content: (_) => Container(
        height: 300,
        width: 350,
        decoration: BoxDecoration(
          color: context.theme.acrylicBackgroundColor,
          border: Border.all(color: theme.borderInputColor),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(10, 20),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: CalendarDatePicker(
                onDateChanged: (d) {
                  flyoutController.close();
                  onDateChanged(d);
                },
                initialDate: selected,
                firstDate: DateTime.now() - 100.days,
                lastDate: DateTime.now() + 1000.days,
              ),
            ),
            TextButton(
              child: const Text('Today'),
              onPressed: () {
                final now = DateTime.now();
                flyoutController.close();
                onDateChanged(now);
              },
            ),
          ],
        ),
      ),
      child: Row(
        children: [
          if (showNavigator)
            IconButton(
              icon: Icon(
                FluentIcons.page_left,
                size: 28,
                color: context.theme.disabledColor,
              ),
              onPressed: () {
                onDateChanged(selected - 1.days);
              },
            ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () => flyoutController.open(),
            child: child ??
                MyBox(
                  height: AS.buttonHeight,
                  width: width,
                  backgroundColor: context.theme.acrylicBackgroundColor,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        selected.formart(),
                        style: FluentTheme.of(context).typography.body,
                      ),
                      const SizedBox(width: 12),
                      const Icon(FluentIcons.calendar),
                    ],
                  ),
                ),
          ),
          const SizedBox(width: 4),
          if (showNavigator)
            IconButton(
              icon: Icon(
                FluentIcons.page_right,
                size: 28,
                color: context.theme.disabledColor,
              ),
              onPressed: () {
                onDateChanged(selected + 1.days);
              },
            ),
        ],
      ),
    );
  }
}
