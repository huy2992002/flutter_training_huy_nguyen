import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class TitleAuth extends StatelessWidget {
  const TitleAuth({
    required this.title,
    required this.subTitle,
    super.key,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            title,
            style: NSStyle.h32Bold,
          ),
          const SizedBox(height: 8),
          Text(
            subTitle,
            style: NSStyle.h16Medium.copyWith(
              color: NSColor.neutral,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
