import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/components/app_bar/action_icon_app_bar.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  /// Create design app bar with height 50px
  /// 
  /// The [onMenu] and [onCart] arguments must not be null.
  const AppBarHome({
    required this.onMenu,
    required this.onCart,
    super.key,
  });

  /// Action when click onTap of menu icon
  final Function() onMenu;

  /// Action when click onTap of cart icon
  final Function() onCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18).copyWith(
        top: MediaQuery.paddingOf(context).top + 3,
        bottom: 3,
      ),
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
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const ActionIconAppBar(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
