import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardMenuItem extends StatelessWidget {
  const CardMenuItem({
    required this.title,
    required this.iconPath,
    this.onTap,
    super.key,
  });

  final String title;
  final String iconPath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          const SizedBox(width: 30),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
        ],
      ),
    );
  }
}
