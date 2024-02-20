import 'package:flutter/material.dart';
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
    const pattern =
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";
    final regex = RegExp(pattern);
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
