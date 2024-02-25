import 'package:flutter/material.dart';

class NsTextButton extends StatelessWidget {
  const NsTextButton({
    required this.onPressed,
    required this.text,
    this.textStyle,
    super.key,
  });

  final Function() onPressed;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: textStyle ??
            Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
      ),
    );
  }
}
