import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/avatar/ns_avatar.dart';
import 'package:nike_sneaker_store/components/dialog/ns_dialog.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/pages/auth/sign_in_page.dart';
import 'package:nike_sneaker_store/pages/cart/cart_page.dart';
import 'package:nike_sneaker_store/pages/home/setting_page.dart';
import 'package:nike_sneaker_store/pages/layout/layout_page.dart';
import 'package:nike_sneaker_store/pages/layout/widgets/card_menu_item.dart';
import 'package:nike_sneaker_store/services/local/shared_pref.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({
    super.key,
    this.resetState,
    this.name,
  });

  final Function()? resetState;
  final String? name;

  @override
  Widget build(BuildContext context) {
    void toPageIndex(int indexPage) {
      currentPageIndex = indexPage;
      zoomController.close?.call();
      resetState?.call();
    }

    return Container(
      padding: EdgeInsets.only(
        left: 28,
        top: MediaQuery.paddingOf(context).top + 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NSAvatar(imagePath: Assets.images.imgAvatar.path),
          const SizedBox(height: 15),
          Text(
            name ?? '-:-',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          const SizedBox(height: 50),
          CardMenuItem(
            onTap: () => toPageIndex(3),
            title: AppLocalizations.of(context).profile,
            iconPath: Assets.icons.icPerson,
          ),
          const SizedBox(height: 30),
          CardMenuItem(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CartPage(),
              ),
            ),
            title: AppLocalizations.of(context).myCart,
            iconPath: Assets.icons.icBag,
          ),
          const SizedBox(height: 30),
          CardMenuItem(
            onTap: () => toPageIndex(1),
            title: AppLocalizations.of(context).favorite,
            iconPath: Assets.icons.icHeartOutline,
          ),
          const SizedBox(height: 30),
          CardMenuItem(
            onTap: () => toPageIndex(2),
            title: AppLocalizations.of(context).notifications,
            iconPath: Assets.icons.icNotification,
          ),
          const SizedBox(height: 30),
          CardMenuItem(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SettingPage(),
              ),
            ),
            title: AppLocalizations.of(context).setting,
            iconPath: Assets.icons.icSetting,
          ),
          const SizedBox(height: 20),
          Divider(
            height: 60,
            thickness: 1,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          CardMenuItem(
            onTap: () {
              NSDialog.question(
                context,
                title: AppLocalizations.of(context).doYouWantLogout,
                action: () => WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    SharedPrefs.removeUserLogin();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignInPage(),
                        ),
                        (route) => false);
                  },
                ),
              );
            },
            title: AppLocalizations.of(context).signOut,
            iconPath: Assets.icons.icSignOut,
          ),
        ],
      ),
    );
  }
}
