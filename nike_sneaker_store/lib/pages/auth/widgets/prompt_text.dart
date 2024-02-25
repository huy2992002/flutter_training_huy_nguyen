import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';

class PromptText extends StatelessWidget {
  const PromptText({
    required this.text,
    required this.title,
    this.onTap,
    super.key,
  });

  final String text;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: NSColor.neutral,
              ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ],
    );
  }
}
