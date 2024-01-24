import 'package:flutter/material.dart';
import 'package:flutter_examples/introduction/basic_widgets.dart';
import 'package:flutter_examples/introduction/custom_widgets.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartShoppingItem> shoppings = [
      const CartShoppingItem(color: Colors.black, title: 'Shopping 2'),
      const CartShoppingItem(color: Colors.red, title: 'Shopping 3'),
      const CartShoppingItem(color: Colors.yellow, title: 'Shopping 4'),
    ];
    return Column(
      children: [
        const BasicWidgets(),
        // Call custom widget CartShoppingItem
        const CartShoppingItem(color: Colors.blue, title: 'Shopping 1'),

        // use List.generate render List CartShoppingItem
        ...List.generate(shoppings.length, (index) => shoppings[index]),
      ],
    );
  }
}
