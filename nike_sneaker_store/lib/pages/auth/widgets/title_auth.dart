import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';

class TitleAuth extends StatelessWidget {
  /// The text displays the title of the page
  /// 
  /// The [title], [subTitle] arguments must not be null.
  const TitleAuth({
    required this.title,
    required this.subTitle,
    super.key,
  });

  /// The title display
  final String title;

  /// The sub title display under title
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
