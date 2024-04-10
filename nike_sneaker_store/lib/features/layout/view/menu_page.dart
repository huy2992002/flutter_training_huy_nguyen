import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_sneaker_store/components/avatar/ns_avatar.dart';
import 'package:nike_sneaker_store/components/dialog/ns_dialog.dart';
import 'package:nike_sneaker_store/features/layout/bloc/layout_cubit.dart';
import 'package:nike_sneaker_store/features/layout/view/widgets/card_menu_item.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/routes/ns_routes_const.dart';
import 'package:nike_sneaker_store/services/local/shared_pref_services.dart';
import 'package:nike_sneaker_store/services/remote/supabase_services.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({
    super.key,
    this.name,
  });

  final String? name;

  @override
  Widget build(BuildContext context) {
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
            onTap: () {
              context.read<LayoutCubit>().onChangePage(3);
              context.push(NSRoutesConst.pathProfile);
              context.read<ZoomDrawerController>().close?.call();
            },
            title: AppLocalizations.of(context).profile,
            iconPath: Assets.icons.icPerson,
          ),
          const SizedBox(height: 30),
          CardMenuItem(
            onTap: () => context.push(NSRoutesConst.pathCart),
            title: AppLocalizations.of(context).myCart,
            iconPath: Assets.icons.icBag,
          ),
          const SizedBox(height: 30),
          CardMenuItem(
            onTap: () {
              context.read<LayoutCubit>().onChangePage(1);
              context.push(NSRoutesConst.pathFavorite);
              context.read<ZoomDrawerController>().close?.call();
            },
            title: AppLocalizations.of(context).favorite,
            iconPath: Assets.icons.icHeartOutline,
          ),
          const SizedBox(height: 30),
          CardMenuItem(
            onTap: () {
              context.read<LayoutCubit>().onChangePage(2);
              context.push(NSRoutesConst.pathNotification);
              context.read<ZoomDrawerController>().close?.call();
            },
            title: AppLocalizations.of(context).notifications,
            iconPath: Assets.icons.icNotification,
          ),
          const SizedBox(height: 30),
          CardMenuItem(
            onTap: () => context.push(NSRoutesConst.pathSetting),
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
                    context
                        .read<SupabaseServices>()
                        .supabaseClient
                        .auth
                        .signOut();
                    context.read<SharedPrefServices>().removeToken();
                    context.pushReplacement(NSRoutesConst.pathSignIn);
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
