import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_sneaker_store/components/app_bar/action_icon_app_bar.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_search_box.dart';
import 'package:nike_sneaker_store/constants/ns_constants.dart';
import 'package:nike_sneaker_store/features/detail/bloc/detail_bloc.dart';
import 'package:nike_sneaker_store/features/detail/bloc/detail_event.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_bloc.dart';
import 'package:nike_sneaker_store/features/home/view/widgets/card_product.dart';
import 'package:nike_sneaker_store/features/search/bloc/search_bloc.dart';
import 'package:nike_sneaker_store/features/search/bloc/search_event.dart';
import 'package:nike_sneaker_store/features/search/bloc/search_state.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/repository/product_repository.dart';
import 'package:nike_sneaker_store/routes/ns_routes_const.dart';
import 'package:nike_sneaker_store/utils/debounce.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// The [TextEditingController] of [TextFormField] search
    TextEditingController _searchController = TextEditingController();

    Debounce debounce = Debounce(milliseconds: 500);

    return BlocProvider(
      create: (context) => SearchBloc(
        productRepository: context.read<ProductRepository>(),
      ),
      child: BlocBuilder<SearchBloc, SearchState>(
        buildWhen: (previous, current) =>
            previous.status != current.status ||
            previous.searchProducts != current.searchProducts,
        builder: (context, state) {
          return Scaffold(
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
              rightIcon: ActionIconAppBar(isMarked: myCarts.isNotEmpty),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  NSSearchBox(
                    controller: _searchController,
                    onChanged: (value) {
                      debounce.run(() {
                        context
                            .read<SearchBloc>()
                            .add(SearchTextChanged(searchText: value));
                      });
                    },
                  ),
                  const SizedBox(height: 18),
                  if (state.status == SearchViewStatus.loading)
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                  else
                    Expanded(
                      child: state.searchProducts.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(top: 250),
                              child: Text(
                                _searchController.text.isEmpty
                                    ? AppLocalizations.of(context).searchProduct
                                    : AppLocalizations.of(context).isNoResult,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : GridView.builder(
                              itemCount: state.searchProducts.length,
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 28),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 3 / 4,
                              ),
                              itemBuilder: (_, index) {
                                final product = state.searchProducts[index];
                                return CardProduct(
                                    tag: NSConstants.tagProductSearch(
                                        product.uuid ?? ''),
                                    product: product,
                                    onTap: () {
                                      context.push(
                                        NSRoutesConst.pathDetail,
                                        extra: NSConstants.tagProductFavorite(
                                            product.uuid ?? ''),
                                      );
                                      final products = context
                                          .read<HomeBloc>()
                                          .state
                                          .products
                                          .where(
                                            (e) =>
                                                e.category == product.category,
                                          )
                                          .toList();
                                      context.read<DetailBloc>().add(
                                            DetailSelectStarted(
                                              product: product,
                                              products: products,
                                            ),
                                          );
                                    });
                              },
                            ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
