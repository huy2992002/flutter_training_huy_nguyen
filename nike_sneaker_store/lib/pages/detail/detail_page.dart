import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/components/app_bar/action_icon_app_bar.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/pages/detail/widgets/ns_read_more.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';
import 'package:nike_sneaker_store/utils/extension.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    required this.product,
    super.key,
  });

  final ProductModel product;

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
          rightIcon: const ActionIconAppBar()),
      body: ListView(
        padding: const EdgeInsets.only(
          left: 20,
          top: 26,
          right: 20,
        ),
        children: [
          Text(product.name, style: NSStyle.h26Bold),
          const SizedBox(height: 8),
          Text(
            product.category,
            style: NSStyle.h16Normal
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 8),
          Text(product.price.toPriceDollar(), style: NSStyle.h24Semibold),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Image.asset(
              product.imagePath,
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
                return Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.only(right: 14),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(
                    productImage.imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 30),
          NSReadMore(text: product.description)
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 27).copyWith(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: SvgPicture.asset(
                Assets.icons.icHeartOutline,
                width: 26,
                height: 26,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            NSElevatedButton.icon(
              onPressed: () {},
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
