import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 200,
              padding: const EdgeInsets.all(4),
              color: Colors.grey,
              alignment: Alignment.center,
              child: const Text('Hello'),
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              padding: const EdgeInsets.all(4),
              color: Colors.grey,
              alignment: Alignment.center,
              child: const Text(
                'One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.',
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Container(
          width: 200,
          height: 200,
          color: Colors.black,
        ),
      ],
    );
  }
}
