import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class NSSearchBox extends StatelessWidget {
  const NSSearchBox({super.key, this.controller, this.onChanged});

  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: NSColor.onPrimaryContainer.withOpacity(0.4),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          border: InputBorder.none,
          hintText: AppLocalizations.of(context).lookingForShoes,
          hintStyle: NSStyle.h14SemiBold.copyWith(
            color: NSColor.neutral
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 24, right: 12),
            child: SvgPicture.asset(Assets.icons.icSearch),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 24,
          ),
        ),
      ),
    );
  }
}
