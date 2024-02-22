import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

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
          Text(title, style: NSStyle.h16SemiBold),
          if (rightIcon != null) rightIcon! else const SizedBox(width: 44),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
