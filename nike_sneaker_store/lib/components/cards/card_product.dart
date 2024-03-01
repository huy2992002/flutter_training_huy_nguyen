import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/utils/extension.dart';

class CardProduct extends StatelessWidget {
  /// Create card item of [CardProduct]
  ///
  /// The [product] arguments must not be null.
  const CardProduct({
    required this.product,
    this.onTap,
    this.onFavorite,
    this.onAddCart,
    super.key,
  });

  /// [product] use display arguments of Object [ProductModel]
  final ProductModel product;

  /// Action when click onTap Widget
  ///
  /// The [onTap] argument can null
  final Function()? onTap;

  /// Action when click onTap icon heart
  ///
  ///The [onFavorite] argument can null
  final Function()? onFavorite;

  /// Action when click onTap icon plus add to cart
  ///
  ///The [onAddCart] argument can null
  final Function()? onAddCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Text(
                  product.price.toPriceDollar(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ],
            ),
          ),
          if (onAddCart != null)
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
