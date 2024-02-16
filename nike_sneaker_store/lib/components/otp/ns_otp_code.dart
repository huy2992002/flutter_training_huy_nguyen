import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';
import 'package:pinput/pinput.dart';

class NsOtpCode extends StatelessWidget {
  const NsOtpCode({
    this.controller,
    this.codeLength = 4,
    this.onChanged,
    this.onCompleted,
    this.onSubmitted,
    this.focusNode,
    super.key,
  });

  final TextEditingController? controller;
  final int codeLength;
  final Function(String)? onChanged;
  final Function(String)? onCompleted;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 76,
      height: 56,
      textStyle: NSStyle.h18Semibold.copyWith(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Pinput(
      controller: controller,
      length: codeLength,
      defaultPinTheme: defaultPinTheme,
      onChanged: onChanged,
      onCompleted: onCompleted,
      onSubmitted: onSubmitted,
      focusNode: focusNode,
    );
  }
}
