import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/app_bar/action_icon_app_bar.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/cards/card_product.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/pages/detail/detail_page.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<ProductModel> _favoriteProducts = [];

  @override
  void initState() {
    _getFavoriteProducts();
    super.initState();
  }

  void _resetState() => setState(() {});

  void _getFavoriteProducts() {
    _favoriteProducts = products.where((e) => e.isFavorite == true).toList();
    _resetState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: NSAppBar(
          title: AppLocalizations.of(context).favorite,
          rightIcon: const ActionIconAppBar()),
      body: _favoriteProducts.isEmpty
          ? Padding(
              padding: const EdgeInsets.only(
                left: 30,
                top: 250,
                right: 30,
              ),
              child: Text(
                AppLocalizations.of(context).noFavoriteProduct,
                style: NSStyle.h21SemiBold
                    .copyWith(color: Theme.of(context).colorScheme.primary),
                textAlign: TextAlign.center,
              ),
            )
          : GridView.builder(
              itemCount: _favoriteProducts.length,
              padding: const EdgeInsets.only(
                left: 20,
                top: 28,
                right: 20,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 5 / 6,
              ),
              itemBuilder: (context, index) {
                final product = _favoriteProducts[index];
                return CardProduct(
                  product: product,
                  onFavorite: () {
                    product.isFavorite = !product.isFavorite;
                    _resetState();
                  },
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(product: product),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
