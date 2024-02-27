import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/components/app_bar/action_icon_app_bar.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/components/snackbar/ns_snackbar.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/pages/detail/widgets/ns_read_more.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';
import 'package:nike_sneaker_store/utils/extension.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    required this.product,
    this.resetState,
    super.key,
  });

  final ProductModel product;
  final Function()? resetState;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ProductModel productView;

  @override
  void initState() {
    productView = widget.product;
    super.initState();
  }

  void _changeFavorite() {
    productView.isFavorite = !productView.isFavorite;
    widget.resetState?.call();
    setState(() {});
  }

  void _resetState() {
    setState(() {});
  }

  void _addToCart(ProductModel product) {
    bool hasCheckCart = myCarts.any((element) => element.uuid == product.uuid);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: NSAppBar(
        leftIcon: NsIconButton(
          onPressed: () => Navigator.pop(context),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          icon: SvgPicture.asset(
            Assets.icons.icArrow,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        title: 'Details',
        rightIcon: ActionIconAppBar(
          isMarked: myCarts.isNotEmpty,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: 20,
          top: 26,
          right: 20,
        ),
        children: [
          Text(
            productView.name,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            productView.category,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            productView.price.toPriceDollar(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Image.asset(
              productView.imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(products.length, (index) {
                final productImage = products[index];
                return GestureDetector(
                  onTap: () {
                    productView = productImage;
                    _resetState();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.only(right: 14),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      border: productView == productImage
                          ? Border.all(
                              color: Theme.of(context).colorScheme.primary,
                            )
                          : null,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      productImage.imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 30),
          NSReadMore(text: productView.description)
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 27).copyWith(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: _changeFavorite,
              child: CircleAvatar(
                radius: 26,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: SvgPicture.asset(
                  productView.isFavorite
                      ? Assets.icons.icHeart
                      : Assets.icons.icHeartOutline,
                  width: 26,
                  height: 26,
                  color: productView.isFavorite
                      ? NSColor.favorite
                      : Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            NSElevatedButton.icon(
              onPressed: () => _addToCart(productView),
              icon: SvgPicture.asset(
                Assets.icons.icBag,
                width: 26,
                height: 26,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 13),
              text: AppLocalizations.of(context).addToCart,
            )
          ],
        ),
      ),
    );
  }
}
