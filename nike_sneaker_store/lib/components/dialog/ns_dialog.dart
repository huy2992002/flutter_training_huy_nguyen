import 'package:flutter/material.dart';

class NSDialog {
  NSDialog._();

  /// Create [Dialog] show message
  ///
  /// The [title] arguments is display title of [Dialog]
  ///
  /// The [content] arguments is display sub content
  ///
  /// The [contentTextStyle] argument is style of content
  /// If [actions] argument is List action
  static void dialog(
    BuildContext context, {
    Widget? title,
    Widget? content,
    TextStyle? contentTextStyle,
    List<Widget>? actions,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(30),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          title: title,
          content: content,
          contentTextStyle:
              contentTextStyle ?? Theme.of(context).textTheme.titleLarge,
          actions: actions,
        );
      },
    );
  }
}
