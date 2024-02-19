import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/cards/card_product.dart';
import 'package:nike_sneaker_store/components/cards/card_sale.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/models/product_model.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel product = ProductModel(
        id: 'id',
        name: 'Nike Jordan',
        imagePath: 'assets/images/img_nike_jordan.png',
        price: 123,
        description: 'description',
        isBestSeller: true,
        isFavorite: true);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardProduct(product: product),
            CardSale(
              title: 'Summer Sale',
              discount: 20,
              imagePath: Assets.images.imgSumerSale.path,
            ),
          ],
        ),
      ),
    );
  }
}
