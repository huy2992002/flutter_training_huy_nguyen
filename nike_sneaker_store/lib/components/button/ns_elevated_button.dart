import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class NSElevatedButton extends StatelessWidget {
  const NSElevatedButton.text({
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    this.isDisable = false,
    super.key,
  });

  const NSElevatedButton.icon({
    required this.onPressed,
    required this.icon,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    this.isDisable = false,
    super.key,
  });

  final Function() onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? icon;
  final EdgeInsetsGeometry padding;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisable ? null : onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: isDisable
            ? Center(
                child: SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(
                    color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                    strokeWidth: 2.5,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: 16),
                  ],
                  Text(
                    text,
                    style: NSStyle.h14SemiBold.copyWith(
                      color:
                          textColor ?? Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
