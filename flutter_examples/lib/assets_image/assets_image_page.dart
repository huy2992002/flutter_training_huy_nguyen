import 'package:flutter/material.dart';

class AssetsImagesPage extends StatelessWidget {
  const AssetsImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // use assets image
        Image.asset('assets/images/done.jpg'),
        // Use image from internet
        Image.network(
          'https://png.pngtree.com/png-vector/20230330/ourmid/pngtree-click-the-done-button-and-tick-icon-vector-png-image_6674611.png',
        ),
      ],
    );
  }
}
