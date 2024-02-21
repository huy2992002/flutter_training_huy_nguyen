import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: NSColor.favorite,
      ),
    );
  }
}
