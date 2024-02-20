import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class TitleUnder extends StatelessWidget {
  const TitleUnder({
    required this.text,
    required this.title,
    this.onTap,
    super.key,
  });

  final String text;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: NSStyle.h16Medium.copyWith(
            color: NSColor.neutral,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: NSStyle.h16SemiBold,
          ),
        ),
      ],
    );
  }
}
