import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';

class TitleAuth extends StatelessWidget {
  const TitleAuth({
    required this.title,
    required this.subTitle,
    super.key,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: NSColor.neutral,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
