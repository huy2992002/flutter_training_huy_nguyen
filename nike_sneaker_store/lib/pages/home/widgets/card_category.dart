import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  /// Create card item of category  
  /// 
  /// The [text] arguments must not be null.  
  const CardCategory({
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    super.key,
  });

  /// Title display of [CardCategory]
  final String text;

  /// Action when click onTap Widget
  /// 
  /// The [onPressed] argument can null
  final Function()? onPressed;

  /// Color of background Widget
  /// 
  /// If [backgroundColor] argument is null, The default color is [Theme.of(context).colorScheme.primaryContainer]
  final Color? backgroundColor;

  /// Color of text widget
  /// 
  /// If [textColor] argument is null, The default color is [Theme.of(context).colorScheme.onPrimaryContainer]
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 11),
        decoration: BoxDecoration(
          color:
              backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: textColor ??
                    Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
      ),
    );
  }
}
