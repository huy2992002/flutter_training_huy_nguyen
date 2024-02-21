import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/app_bar/app_bar_home.dart';
import 'package:nike_sneaker_store/components/cards/card_category.dart';
import 'package:nike_sneaker_store/components/cards/card_product.dart';
import 'package:nike_sneaker_store/components/cards/card_sale.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_search_box.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/pages/home/widgets/title_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int categoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      AppLocalizations.of(context).allShoes,
      AppLocalizations.of(context).outDoor,
      AppLocalizations.of(context).tennis,
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarHome(
        onMenu: () {},
        onCart: () {},
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 16),
        children: [
          const NSSearchBox(),
          const SizedBox(height: 24),
          TitleHome(text: AppLocalizations.of(context).selectCategory),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                categories.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CardCategory(
                    onPressed: () => setState(() => categoryIndex = index),
                    text: categories[index],
                    backgroundColor: categoryIndex == index
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.primaryContainer,
                    textColor: categoryIndex == index
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          TitleHome(text: AppLocalizations.of(context).popularShoes),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(products.length, (index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CardProduct(
                    product: product,
                    onFavorite: () {
                      setState(() {
                        product.isFavorite = !product.isFavorite;
                      });
                    },
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 24),
          TitleHome(text: AppLocalizations.of(context).newArrivals),
          CardSale(
            title: AppLocalizations.of(context).summerSale,
            discount: 50,
            imagePath: Assets.images.imgSumerSale.path,
          ),
        ],
      ),
    );
  }
}
