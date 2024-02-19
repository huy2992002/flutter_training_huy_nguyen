import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    super.key,
  });

  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 11),
        decoration: BoxDecoration(
          color:
              backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: NSStyle.h12Normal.copyWith(
            color:
                textColor ?? Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
