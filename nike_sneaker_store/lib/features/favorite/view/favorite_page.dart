import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_sneaker_store/components/app_bar/action_icon_app_bar.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/features/favorite/bloc/favorite_bloc.dart';
import 'package:nike_sneaker_store/features/favorite/bloc/favorite_event.dart';
import 'package:nike_sneaker_store/features/favorite/bloc/favorite_state.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_bloc.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_event.dart';
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
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      buildWhen: (previous, current) =>
          previous.favoriteProducts != current.favoriteProducts,
      builder: (context, state) {
        return Scaffold(
          appBar: NSAppBar(
            title: AppLocalizations.of(context).favorite,
            rightIcon: ActionIconAppBar(
              isMarked: myCarts.isNotEmpty,
            ),
          ),
          body: state.favoriteProducts.isEmpty
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
                  itemCount: state.favoriteProducts.length,
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
                    final product = state.favoriteProducts[index];
                    return CardProduct(
                        product: product,
                        onFavorite: () {
                          String? userId = context
                              .read<SupabaseServices>()
                              .supabaseClient
                              .auth
                              .currentUser
                              ?.id;
                          if (userId != null && product.uuid != null) {
                            context.read<HomeBloc>().add(
                                HomeFavoriteRemove(productId: product.uuid!));
                            context.read<FavoriteBloc>().add(
                                  FavoriteRemove(
                                    userId,
                                    productID: product.uuid!,
                                  ),
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
