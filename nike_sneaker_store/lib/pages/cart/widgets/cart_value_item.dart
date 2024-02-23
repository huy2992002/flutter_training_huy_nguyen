import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class CartValueItem extends StatelessWidget {
  const CartValueItem({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: NSStyle.h16Medium.copyWith(color: NSColor.neutral),
        ),
        const Spacer(),
        Text(
          value,
          style: NSStyle.h16SemiBold.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
