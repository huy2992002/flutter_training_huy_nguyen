import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/components/app_bar/action_icon_app_bar.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/components/cards/card_product.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_search_box.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/pages/detail/detail_page.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ProductModel> _searchProducts = [];
  TextEditingController _searchController = TextEditingController();

  void _resetState() => setState(() {});

  void _search(String searchText) {
    if (searchText.isEmpty) {
      _searchProducts = [];
      _resetState();
      return;
    }
    _searchProducts = products
        .where((e) => e.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    _resetState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: NSAppBar(
        title: AppLocalizations.of(context).search,
        leftIcon: NsIconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            Assets.icons.icArrow,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        rightIcon: const ActionIconAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 24),
            NSSearchBox(
              controller: _searchController,
              onChanged: _search,
            ),
            const SizedBox(height: 18),
            Expanded(
              child: _searchProducts.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 250),
                      child: Text(
                        _searchController.text.isEmpty
                            ? AppLocalizations.of(context).searchProduct
                            : AppLocalizations.of(context).isNoResult,
                        style: NSStyle.h21SemiBold.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : GridView.builder(
                      itemCount: _searchProducts.length,
                      padding: const EdgeInsets.only(top: 10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 5 / 6,
                      ),
                      itemBuilder: (context, index) {
                        final product = _searchProducts[index];
                        return CardProduct(
                          product: product,
                          onFavorite: () {
                            product.isFavorite = !product.isFavorite;
                            _resetState();
                          },
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(product: product),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
