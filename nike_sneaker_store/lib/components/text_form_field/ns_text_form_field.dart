import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class NSTextFormField extends StatefulWidget {
  const NSTextFormField.text({
    required this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.textInputAction,
    this.isPassword = false,
    super.key,
  });

  const NSTextFormField.password({
    required this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.textInputAction,
    this.isPassword = true,
    super.key,
  });

  final TextEditingController? controller;
  final String hintText;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final bool isPassword;

  @override
  State<NSTextFormField> createState() => _NSTextFormFieldState();
}

class _NSTextFormFieldState extends State<NSTextFormField> {
  bool _isShowPassword = false;
  @override
  void initState() {
    _isShowPassword = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondaryContainer,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(14),
        ),
        hintText: widget.hintText,
        hintStyle: NSStyle.h14Medium.copyWith(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () => setState(() => _isShowPassword = !_isShowPassword),
                child: SvgPicture.asset(
                  _isShowPassword
                      ? Assets.icons.icEyeHidden
                      : Assets.icons.icEye,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              )
            : null,
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 24,
          maxWidth: 48,
          minHeight: 24,
          minWidth: 48,
        ),
      ),
      obscureText: _isShowPassword,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
    );
  }
}
