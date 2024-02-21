import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/constants/ns_constants.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';

class Validator {
  static String? validatorRequired(BuildContext context, String? value) {
    if ((value ?? '').isEmpty) {
      return AppLocalizations.of(context).fieldIsRequired;
    }
    return null;
  }

  static String? validatorEmail(BuildContext context, String? value) {
    if ((value ?? '').isEmpty) {
      return AppLocalizations.of(context).fieldIsRequired;
    }

    final regex = RegExp(NSConstants.emailPattern);
    if (!regex.hasMatch(value ?? '')) {
      return AppLocalizations.of(context).validEmailAddress;
    }
    return null;
  }

  static String? validatorPassword(BuildContext context, String? value) {
    if ((value ?? '').isEmpty) {
      return AppLocalizations.of(context).fieldIsRequired;
    }
    if ((value ?? '').length < 6) {
      return AppLocalizations.of(context).passwordLeast6;
    }
    return null;
  }

  static String? validatorConfirmPassword(
    BuildContext context,
    String? value,
    String password,
  ) {
    if ((value ?? '').isEmpty) {
      return AppLocalizations.of(context).fieldIsRequired;
    }
    if ((value ?? '').length < 6) {
      return AppLocalizations.of(context).passwordLeast6;
    }
    if (value != password) {
      return AppLocalizations.of(context).confirmPasswordNotMatch;
    }
    return null;
  }
}
