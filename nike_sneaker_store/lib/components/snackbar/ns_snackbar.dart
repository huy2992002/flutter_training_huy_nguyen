import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class NSSnackBar {
  static void snackbarDefault(
    BuildContext context, {
    required String title,
    Color? color,
    String? iconPath,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          decoration: BoxDecoration(
            color: color ?? NSColor.darkPrimaryContainer,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath ?? Assets.icons.icTick,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: NSStyle.h16Normal.copyWith(
                    color: NSColor.darkOnPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void snackbarSuccess(
    BuildContext context, {
    required String title,
  }) {
    snackbarDefault(
      context,
      title: title,
      color: NSColor.success,
    );
  }

  static void snackbarError(
    BuildContext context, {
    required String title,
  }) {
    snackbarDefault(
      context,
      title: title,
      color: NSColor.error,
      iconPath: Assets.icons.icError,
    );
  }

  static void snackbarWarning(
    BuildContext context, {
    required String title,
  }) {
    snackbarDefault(
      context,
      title: title,
      color: NSColor.warning,
      iconPath: Assets.icons.icWarning,
    );
  }
}
