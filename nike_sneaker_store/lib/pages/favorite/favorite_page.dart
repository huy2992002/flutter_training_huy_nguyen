import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/app_bar/icon_cart_app_bar.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/cards/card_product.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/pages/detail/detail_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: NSAppBar(
          title: AppLocalizations.of(context).favorite,
          rightIcon: const IconCartAppBar()),
      body: GridView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 28),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 5 / 6),
        itemBuilder: (context, index) {
          final product = products[index];
          return CardProduct(
            product: product,
            onFavorite: () =>
                setState(() => product.isFavorite = !product.isFavorite),
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
