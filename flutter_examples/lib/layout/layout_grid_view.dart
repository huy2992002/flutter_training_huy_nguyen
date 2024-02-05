import 'package:flutter/material.dart';

class LayoutGridView extends StatelessWidget {
  const LayoutGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: [
        Container(color: Colors.lightBlue),
        Container(color: Colors.lightBlue),
        Container(color: Colors.lightBlue),
        Container(color: Colors.lightBlue),
        Container(color: Colors.lightBlue),
        Container(color: Colors.lightBlue),
        Container(color: Colors.lightBlue),
        Container(color: Colors.lightBlue),
      ],
    );
  }
}
