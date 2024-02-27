import 'package:flutter/material.dart';

class NSAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Create design app bar with height 50px 
  /// with title of app bar is [title], two icon left and right
  /// 
  /// The [title] arguments must not be null.
  const NSAppBar({
    required this.title,
    this.leftIcon,
    this.rightIcon,
    super.key,
  });

  /// The text to display center app bar
  final String title;

  /// Icon display left of app bar
  /// If [leftIcon] argument is null, no display left app bar
  final Widget? leftIcon;

  /// Icon display right of app bar
  /// If [rightIcon] argument is null, no display right app bar
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
