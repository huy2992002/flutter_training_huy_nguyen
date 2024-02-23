import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class CartInformationItem extends StatelessWidget {
  const CartInformationItem({
    required this.iconPath,
    required this.label,
    required this.onEdit,
    this.controller,
    this.onChanged,
    this.focusNode,
    super.key,
  });

  final String iconPath;
  final TextEditingController? controller;
  final String label;
  final Function() onEdit;
  final Function(String)? onChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SvgPicture.asset(
            iconPath,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller,
                onChanged: onChanged,
                style: NSStyle.h14SemiBold.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                focusNode: focusNode,
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: NSStyle.h12Medium,
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: onEdit,
          child: SvgPicture.asset(Assets.icons.icEdit),
        ),
      ],
    );
  }
}
