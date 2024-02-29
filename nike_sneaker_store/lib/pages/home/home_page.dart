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
import 'package:nike_sneaker_store/pages/home/search_page.dart';
import 'package:nike_sneaker_store/pages/home/widgets/title_home.dart';
import 'package:nike_sneaker_store/pages/main/main_page.dart';

class HomePage extends StatefulWidget {
  /// The home Screen
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// [List] containing the display product according to category
  List<ProductModel> _productViews = [];

  /// index of category selected
  int _categoryIndex = 0;

  @override
  void initState() {
    _getProducts();
    super.initState();
  }

  /// Function reset state
  void _resetState() => setState(() {});

  /// The function get products
  void _getProducts() {
    _productViews = products;
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      AppLocalizations.of(context).allShoes,
      AppLocalizations.of(context).outDoor,
      AppLocalizations.of(context).tennis,
    ];

    List<String> checkCategory = [
      'All Shoes',
      'Outdoor',
      'Tennis',
    ];

    void changeCategory(String category) {
      if (category == 'All Shoes') {
        _productViews = products;
        _resetState();
        return;
      }
      _productViews = products.where((e) => e.category == category).toList();
      _resetState();
    }

    void addCart(ProductModel product) {
      bool hasCheckCart =
          myCarts.any((element) => element.uuid == product.uuid);
      if (hasCheckCart) {
        NSSnackBar.snackbarWarning(
          context,
          title: AppLocalizations.of(context).productAlreadyInCart,
        );
      } else {
        myCarts.add(product..quantity = 1);
        _resetState();
        NSSnackBar.snackbarSuccess(
          context,
          title: AppLocalizations.of(context).productAddSuccess,
        );
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarHome(
        onMenu: () {
          zoomController.toggle?.call();
        },
        isMarkerNotification: myCarts.isNotEmpty,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 16, bottom: 20),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: NSSearchBox(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SearchPage(),
                  ),
                );
              },
              readOnly: true,
            ),
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
                        _categoryIndex = index;
                        _resetState();
                        changeCategory(checkCategory[index]);
                      },
                      text: categories[index],
                      backgroundColor: _categoryIndex == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.primaryContainer,
                      textColor: _categoryIndex == index
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
                children: List.generate(_productViews.length, (index) {
                  final product = _productViews[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CardProduct(
                      product: product,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPage(
                            product: product,
                            resetState: _resetState,
                          ),
                        ),
                      ),
                      onAddCart: () {
                        addCart(product);
                      },
                      onFavorite: () {
                        product.isFavorite = !product.isFavorite;
                        _resetState();
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
