import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_sneaker_store/components/app_bar/action_icon_app_bar.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/snackbar/ns_snackbar.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_bloc.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_event.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_state.dart';
import 'package:nike_sneaker_store/features/home/view/widgets/card_product.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/routes/ns_routes_const.dart';
import 'package:nike_sneaker_store/services/remote/supabase_services.dart';

class FavoritePage extends StatefulWidget {
  /// Screen display favorite products
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) =>
          previous.homeStatus != current.homeStatus,
      listener: (context, state) {
        if (state.homeStatus == HomeViewStatus.failure) {
          NSSnackBar.snackbarError(context, title: state.errorMessage);
        }
      },
      builder: (context, state) {
        final favoriteProducts =
            state.products.where((e) => e.isFavorite == true).toList();
        return Scaffold(
          appBar: NSAppBar(
            title: AppLocalizations.of(context).favorite,
            rightIcon: ActionIconAppBar(
              isMarked: myCarts.isNotEmpty,
            ),
          ),
          body: favoriteProducts.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    top: 250,
                    right: 30,
                  ),
                  child: Text(
                    AppLocalizations.of(context).noFavoriteProduct,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                )
              : GridView.builder(
                  itemCount: favoriteProducts.length,
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 28,
                    right: 20,
                    bottom: 28,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (_, index) {
                    final product = favoriteProducts[index];
                    return CardProduct(
                        product: product,
                        onFavorite: () {
                          String? userId = context
                              .read<SupabaseServices>()
                              .supabaseClient
                              .auth
                              .currentUser
                              ?.id;
                          if (userId != null) {
                            context.read<HomeBloc>().add(
                                  HomeFavoritePressed(
                                    userId: userId,
                                    productId: product.uuid,
                                  ),
                                );
                          } else {
                            NSSnackBar.snackbarError(
                              context,
                              title: AppLocalizations.of(context).notFoundUser,
                            );
                          }
                        },
                        onTap: () => context.push(NSRoutesConst.pathDetail));
                  },
                ),
        );
      },
    );
  }
}