import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nike_sneaker_store/components/app_bar/action_icon_app_bar.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  /// Create design app bar with height 50px
  const AppBarHome({
    this.isMarkerNotification = false,
    super.key,
  });

  /// The [isMarkerNotification] argument is true will display marker with notification
  final bool isMarkerNotification;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          context.read<ZoomDrawerController>().open?.call();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SvgPicture.asset(
            Assets.icons.icMenu,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      leadingWidth: 43,
      title: Text(
        AppLocalizations.of(context).explore,
        style: Theme.of(context).textTheme.displaySmall,
      ),
      actions: [
        ActionIconAppBar(
          isMarked: isMarkerNotification,
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
