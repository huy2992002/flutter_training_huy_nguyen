import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/components/dialog/ns_dialog.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/pages/cart/cart_information_page.dart';
import 'package:nike_sneaker_store/pages/cart/widgets/card_cart_product.dart';
import 'package:nike_sneaker_store/pages/cart/widgets/cart_total_cost.dart';

class CartPage extends StatefulWidget {
  /// Screen display my carts
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: NSAppBar(
        leftIcon: NsIconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            Assets.icons.icArrow,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        title: AppLocalizations.of(context).myCart,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: myCarts.isEmpty
            ? Center(
                child: Text(
                  AppLocalizations.of(context).cartEmpty,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                  textAlign: TextAlign.center,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context).intItem(myCarts.length),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(top: 8),
                      itemBuilder: (_, index) {
                        final product = myCarts[index];
                        return CardCartProduct(
                          product: product,
                          onPlus: () {
                            setState(() {
                              product.quantity++;
                            });
                          },
                          onLess: () {
                            if (product.quantity > 1) {
                              setState(() {
                                product.quantity--;
                              });
                            } else {
                              NSDialog.question(
                                context,
                                title: AppLocalizations.of(context)
                                    .doYouWantRemoveFromCart,
                                action: () {
                                  setState(() {
                                    myCarts.remove(product);
                                  });
                                },
                              );
                            }
                          },
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 14),
                      itemCount: myCarts.length,
                    ),
                  )
                ],
              ),
      ),
      bottomNavigationBar: CartTotalCost(
        onCheckout: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const CartInformationPage(),
          ),
        ),
        canCheckOut: myCarts.isNotEmpty,
      ),
    );
  }
}
