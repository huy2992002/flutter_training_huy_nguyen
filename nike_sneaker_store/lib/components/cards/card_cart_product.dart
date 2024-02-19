import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class CardCartProduct extends StatelessWidget {
  const CardCartProduct({
    required this.product,
    this.onTap,
    this.onPlus,
    this.onLess,
    super.key,
  });

  final ProductModel product;
  final Function()? onTap;
  final Function()? onPlus;
  final Function()? onLess;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 85,
              height: 85,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(product.imagePath),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: NSStyle.h16Medium),
                  Text(
                    '\$ ${product.price.toStringAsFixed(2)}',
                    style: NSStyle.h14Medium,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  Assets.icons.icAdd,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '${product.quantity}',
                    style: NSStyle.h14Medium.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  Assets.icons.icRemove,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
