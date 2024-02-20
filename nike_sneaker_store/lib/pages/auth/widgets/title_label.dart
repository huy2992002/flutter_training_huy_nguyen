import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class TitleLabel extends StatelessWidget {
  const TitleLabel({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: NSStyle.h16SemiBold,
      ),
    );
  }
}
