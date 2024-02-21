import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';
import 'package:nike_sneaker_store/utils/extension.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    required this.product,
    this.onTap,
    this.onFavorite,
    this.onAddCart,
    super.key,
  });

  final ProductModel product;
  final Function()? onTap;
  final Function()? onFavorite;
  final Function()? onAddCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: onFavorite,
                  child: product.isFavorite
                      ? SvgPicture.asset(Assets.icons.icHeart)
                      : SvgPicture.asset(
                          Assets.icons.icHeartOutline,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                ),
                Image.asset(
                  product.imagePath,
                  width: 120,
                  height: 54,
                ),
                const SizedBox(height: 12),
                if (product.isBestSeller) ...[
                  Text(
                    'BEST SELLER',
                    style: NSStyle.h12Medium.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(product.name, style: NSStyle.h16SemiBold),
                const SizedBox(height: 12),
                Text(
                  product.price.toPriceDollar(),
                  style: NSStyle.h14Medium,
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: onAddCart,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: SvgPicture.asset(
                  Assets.icons.icAdd,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
