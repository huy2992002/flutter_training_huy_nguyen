import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class TitleHome extends StatelessWidget {
  const TitleHome({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 14),
      child: Text(
        text,
        style: NSStyle.h16SemiBold,
      ),
    );
  }
}
