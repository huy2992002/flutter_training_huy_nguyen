import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';

class NSBottomNavigationBar extends StatelessWidget {
  const NSBottomNavigationBar({
    required this.currentIndex,
    required this.onChangePage,
    super.key,
  });

  final int currentIndex;
  final Function(int) onChangePage;

  @override
  Widget build(BuildContext context) {
    List<String> iconPaths = [
      Assets.icons.icHome,
      Assets.icons.icHeartOutline,
      Assets.icons.icNotification,
      Assets.icons.icPerson,
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Theme.of(context).colorScheme.onPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          iconPaths.length,
          (index) => GestureDetector(
            onTap: () => onChangePage(index),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onPrimary,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                iconPaths[index],
                width: 24,
                height: 24,
                color: currentIndex == index
                    ? Theme.of(context).colorScheme.onPrimary
                    : NSColor.neutral,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
