import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';

class NSSearchBox extends StatelessWidget {
  const NSSearchBox({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
  });

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool readOnly;

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
        onTap: onTap,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          border: InputBorder.none,
          hintText: AppLocalizations.of(context).lookingForShoes,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 24, right: 12),
            child: SvgPicture.asset(
              Assets.icons.icSearch,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 24,
          ),
        ),
        readOnly: readOnly,
      ),
    );
  }
}
