import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_sneaker_store/components/app_bar/app_bar_home.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_search_box.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_bloc.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_event.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_state.dart';
import 'package:nike_sneaker_store/features/home/view/widgets/card_category.dart';
import 'package:nike_sneaker_store/features/home/view/widgets/card_product.dart';
import 'package:nike_sneaker_store/features/home/view/widgets/card_sale.dart';
import 'package:nike_sneaker_store/features/home/view/widgets/title_home.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/routes/ns_routes_const.dart';
import 'package:nike_sneaker_store/utils/enum.dart';

class HomePage extends StatelessWidget {
  /// The home Screen
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> _categories = [
      CategoryModel(
        name: AppLocalizations.of(context).allShoes,
        type: CategoryType.allShoes.name,
      ),
      CategoryModel(
        name: AppLocalizations.of(context).outDoor,
        type: CategoryType.outDoor.name,
      ),
      CategoryModel(
        name: AppLocalizations.of(context).tennis,
        type: CategoryType.tennis.name,
      ),
    ];

    return Scaffold(
      appBar: AppBarHome(
        isMarkerNotification: myCarts.isNotEmpty,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading ||
            previous.productDisplays != current.productDisplays,
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<HomeBloc>().add(HomeStarted());
            },
            child: ListView(
              padding: const EdgeInsets.only(top: 16, bottom: 20),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: NSSearchBox(
                    onTap: () => context.push(NSRoutesConst.pathSearch),
                    readOnly: true,
                  ),
                ),
                const SizedBox(height: 24),
                TitleHome(text: AppLocalizations.of(context).selectCategory),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: _categories.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: CardCategory(
                          onPressed: () => context.read<HomeBloc>().add(
                                HomeCategoryPressed(
                                  index: index,
                                  type: category.type,
                                ),
                              ),
                          text: category.name,
                          backgroundColor: state.categoryIndex == index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primaryContainer,
                          textColor: state.categoryIndex == index
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                TitleHome(text: AppLocalizations.of(context).popularShoes),
                SizedBox(
                  height: 201,
                  child: state.isLoading
                      ? ListView.separated(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (context, index) {
                            return const CardProductLoading();
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 20),
                        )
                      : ListView.builder(
                          itemCount: state.productDisplays.length,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (context, index) {
                            final product = state.productDisplays[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: CardProduct(
                                product: product,
                                onTap: () =>
                                    context.push(NSRoutesConst.pathDetail),
                                onAddCart: () {
                                  // addCart(product);
                                },
                                onFavorite: () {
                                  // product.isFavorite = !product.isFavorite;
                                  // setState(() {});
                                },
                              ),
                            );
                          },
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
        },
      ),
    );
  }
}

class CategoryModel {
  CategoryModel({required this.name, required this.type});
  String name;
  String type;
}
