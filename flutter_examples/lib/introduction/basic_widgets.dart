import 'package:flutter/material.dart';
import 'package:flutter_examples/introduction/custom_widgets.dart';

class BasicWidgets extends StatefulWidget {
  const BasicWidgets({super.key});

  @override
  State<BasicWidgets> createState() => _BasicWidgetsState();
}

class _BasicWidgetsState extends State<BasicWidgets> {
  Color color = Colors.blue;

  List<CartShoppingItem> shoppings = [
    const CartShoppingItem(color: Colors.black, title: 'Shopping 2'),
    const CartShoppingItem(color: Colors.red, title: 'Shopping 3'),
    const CartShoppingItem(color: Colors.yellow, title: 'Shopping 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      // layout in vertical directions
      children: [
        const Row(
          // layout in horizontal directions
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello world',
              // use TextStyle for style with text
              style: TextStyle(fontSize: 32, color: Colors.red),
            ),
          ],
        ),
        const SizedBox(height: 40), // The space has a height of 40
        Container(
          //The Container widget lets you create a rectangular visual element.
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.red),
          ),
        ),
        const SizedBox(height: 40),
        Stack(
          children: [
            Container(
              width: 50,
              height: 90,
              color: Colors.yellow,
            ),
            const Positioned(
              //a Stack widget lets you place widgets on top of each other in paint order.
              bottom: 0,
              child: Text('Bottom'),
            ),
          ],
        ),
        const SizedBox(height: 40),
        GestureDetector(
          //The GestureDetector widget doesn’t have a visual representation but instead detects gestures made by the user.
          onTap: () {
            color = Colors.pink;
            setState(() {}); // change state
          },
          child: Container(
            width: 50,
            height: 50,
            color: color,
          ),
        ),
        // Call custom widget CartShoppingItem
        const CartShoppingItem(color: Colors.blue, title: 'Shopping 1'),

        // use List.generate render List CartShoppingItem
        ...List.generate(shoppings.length, (index) => shoppings[index]),
      ],
    );
  }
}
