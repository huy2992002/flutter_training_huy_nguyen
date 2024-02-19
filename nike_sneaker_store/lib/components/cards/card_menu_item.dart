import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

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
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          const SizedBox(width: 30),
          Text(
            title,
            style: NSStyle.h16Medium.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
