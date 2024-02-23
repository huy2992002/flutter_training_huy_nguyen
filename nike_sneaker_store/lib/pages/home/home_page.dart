import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/app_bar/app_bar_home.dart';
import 'package:nike_sneaker_store/components/cards/card_category.dart';
import 'package:nike_sneaker_store/components/cards/card_product.dart';
import 'package:nike_sneaker_store/components/cards/card_sale.dart';
import 'package:nike_sneaker_store/components/snackbar/ns_snackbar.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_search_box.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/pages/detail/detail_page.dart';
import 'package:nike_sneaker_store/pages/home/widgets/title_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> productViews = [];
  int categoryIndex = 0;

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  void getProducts() {
    productViews = products;
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      AppLocalizations.of(context).allShoes,
      AppLocalizations.of(context).outDoor,
      AppLocalizations.of(context).tennis,
    ];

    void changeCategory(String category) {
      if (category == AppLocalizations.of(context).allShoes) {
        productViews = products;
        setState(() {});
        return;
      }
      productViews = products.where((e) => e.category == category).toList();
      setState(() {});
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarHome(
        onMenu: () {},
        onCart: () {},
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 16),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: NSSearchBox(),
          ),
          const SizedBox(height: 24),
          TitleHome(text: AppLocalizations.of(context).selectCategory),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: List.generate(
                  categories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: CardCategory(
                      onPressed: () {
                        setState(() => categoryIndex = index);
                        changeCategory(categories[index]);
                      },
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
          ),
          const SizedBox(height: 24),
          TitleHome(text: AppLocalizations.of(context).popularShoes),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: List.generate(productViews.length, (index) {
                  final product = productViews[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CardProduct(
                      product: product,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(product: product),
                        ),
                      ),
                      onAddCart: () {
                        bool hasCheckCart = myCarts
                            .any((element) => element.uuid == product.uuid);
                        if (hasCheckCart) {
                          NSSnackBar.snackbarWarning(
                            context,
                            title: AppLocalizations.of(context)
                                .productAlreadyInCart,
                          );
                        } else {
                          myCarts.add(product..quantity = 1);
                          NSSnackBar.snackbarSuccess(
                            context,
                            title:
                                AppLocalizations.of(context).productAddSuccess,
                          );
                        }
                      },
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
          ),
          const SizedBox(height: 24),
          TitleHome(
            text: AppLocalizations.of(context).newArrivals,
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CardSale(
              title: AppLocalizations.of(context).summerSale,
              discount: 50,
              imagePath: Assets.images.imgSumerSale.path,
            ),
          ),
        ],
      ),
    );
  }
}
