import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';

class NSDrawer extends StatelessWidget {
  const NSDrawer({
    required this.menuScreen,
    required this.mainScreen,
    this.controller,
    super.key,
  });

  final ZoomDrawerController? controller;
  final Widget menuScreen;
  final Widget mainScreen;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: controller,
      menuScreen: menuScreen,
      mainScreen: mainScreen,
      mainScreenTapClose: true,
      angle: -5,
      menuBackgroundColor: Theme.of(context).colorScheme.secondary,
      boxShadow: const [
        BoxShadow(
          color: NSColor.onPrimaryContainer,
          blurRadius: 2,
        )
      ],
    );
  }
}
