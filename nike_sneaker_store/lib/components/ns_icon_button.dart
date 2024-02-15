import 'package:flutter/material.dart';

class NsIconButton extends StatelessWidget {
  const NsIconButton({
    required this.onPressed,
    required this.icon,
    this.backgroundColor,
    super.key,
  });

  final Function() onPressed;
  final Widget icon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color:
              backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
