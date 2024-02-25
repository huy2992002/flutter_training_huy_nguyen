import 'package:flutter/material.dart';

class NSAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NSAppBar({
    required this.title,
    this.leftIcon,
    this.rightIcon,
    super.key,
  });

  final String title;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18).copyWith(
        top: MediaQuery.paddingOf(context).top + 3,
        bottom: 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leftIcon != null) leftIcon! else const SizedBox(width: 44),
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          if (rightIcon != null) rightIcon! else const SizedBox(width: 44),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
