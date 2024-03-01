import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';

class NSDialog {
  NSDialog._();

  /// Create [Dialog] show message
  ///
  /// The [title] arguments is display title of [Dialog]
  ///
  /// The [subTitle] arguments is display sub title
  ///
  /// The [icon] argument display icon
  /// If [icon] argument is null, no display icon
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
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: NSColor.neutral,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Create [Dialog] show message have button implement action
  ///
  /// The [title] arguments is display title of [Dialog]
  ///
  /// The [textButton] arguments is display title of button
  ///
  /// The [icon] argument display icon
  /// If [icon] argument is null, no display icon
  ///
  /// The [icon] action when onTap button
  /// [icon] can null
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
            const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
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

  static void question(
    BuildContext context, {
    required String title,
    Function()? action,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NSElevatedButton.text(
                  onPressed: () {
                    action?.call();
                    Navigator.pop(context);
                  },
                  text: AppLocalizations.of(context).yes,
                ),
                const SizedBox(width: 14),
                NSElevatedButton.text(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: AppLocalizations.of(context).no,
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  textColor: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
