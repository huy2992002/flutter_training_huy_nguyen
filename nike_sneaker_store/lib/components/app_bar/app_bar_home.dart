import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({
    required this.onMenu,
    required this.onCart,
    super.key,
  });

  final Function() onMenu;
  final Function() onCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18).copyWith(
        top: MediaQuery.paddingOf(context).top + 3,
        bottom: 3,
      ),
      color: Theme.of(context).colorScheme.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onMenu,
            child: SvgPicture.asset(
              Assets.icons.icMenu,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          Text(
            AppLocalizations.of(context).explore,
            style: NSStyle.h32Bold,
          ),
          Stack(
            children: [
              NsIconButton(
                onPressed: onMenu,
                icon: SvgPicture.asset(
                  Assets.icons.icBag,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
