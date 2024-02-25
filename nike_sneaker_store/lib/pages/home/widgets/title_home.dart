import 'package:flutter/material.dart';

class TitleHome extends StatelessWidget {
  const TitleHome({
    required this.text,
    this.padding,
    super.key,
  });

  final String text;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 20, bottom: 14),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );
  }
}
