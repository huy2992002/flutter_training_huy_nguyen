import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class NSDialog {
  NSDialog._();

  static void text(
    BuildContext context, {
    required String title,
    required String subTitle,
    Widget? icon,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.all(30),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon,
              const SizedBox(height: 16),
            ],
            Text(title, style: NSStyle.h16Bold),
            const SizedBox(height: 8),
            Text(
              subTitle,
              style: NSStyle.h16Normal.copyWith(color: NSColor.neutral),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  static void textButton(
    BuildContext context, {
    required String title,
    required String textButton,
    Widget? icon,
    Function()? action,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 76, vertical: 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon,
              const SizedBox(height: 16),
            ],
            Text(
              title,
              style: NSStyle.h20Medium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            NSElevatedButton.text(
              onPressed: () {
                action?.call();
                Navigator.pop(context);
              },
              text: textButton,
            ),
          ],
        ),
      ),
    );
  }
}
