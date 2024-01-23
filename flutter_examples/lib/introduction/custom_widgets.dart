import 'package:flutter/material.dart';

class CartShoppingItem extends StatelessWidget {
  // create a class CartShoppingItem use together many times
  const CartShoppingItem({
    required this.color,
    required this.title,
    super.key,
  });
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(backgroundColor: color),
        const SizedBox(width: 10),
        Text(title),
      ],
    );
  }
}
