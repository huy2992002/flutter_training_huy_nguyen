import 'package:flutter/material.dart';

class NSAvatar extends StatelessWidget {
  const NSAvatar({
    required this.imagePath,
    this.radius = 48,
    super.key,
  });

  final String imagePath;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(imagePath),
    );
  }
}
