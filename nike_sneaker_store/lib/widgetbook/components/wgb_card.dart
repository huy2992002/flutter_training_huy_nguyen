import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/cards/card_cart_product.dart';
import 'package:nike_sneaker_store/components/cards/card_category.dart';
import 'package:nike_sneaker_store/components/cards/card_notification.dart';
import 'package:nike_sneaker_store/components/cards/card_product.dart';
import 'package:nike_sneaker_store/components/cards/card_sale.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/models/notification_model.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Cards',
  type: CardCartProduct,
)
Widget cardCartProduct(BuildContext context) {
  ProductModel product = ProductModel(
    uuid: 'uuid',
    name: context.knobs.string(
      label: 'Product name',
      initialValue: 'Product 1',
    ),
    imagePath: Assets.images.imgNikeAirMax.path,
    price:
        context.knobs.double.input(label: 'Product price', initialValue: 200),
    quantity: context.knobs.int.slider(
      label: 'Quantity product',
      initialValue: 20,
      min: 1,
      max: 50,
    ),
    description: 'description',
    isBestSeller: false,
    category: 'category',
  );
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardCartProduct(product: product),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Cards',
  type: CardCategory,
)
Widget cardCategory(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CardCategory(
        text: 'All Shoes',
        backgroundColor: Theme.of(context).colorScheme.primary,
        textColor: Theme.of(context).colorScheme.onPrimary,
      ),
      const SizedBox(width: 20),
      const CardCategory(text: 'Tennis'),
    ],
  );
}

@widgetbook.UseCase(
  name: 'Cards',
  type: CardNotification,
)
Widget cardNotification(BuildContext context) {
  ProductModel product = ProductModel(
    uuid: 'uuid',
    name: 'name product',
    imagePath: Assets.images.imgNikeAirMax.path,
    price: 200,
    quantity: context.knobs.int.slider(
      label: 'Quantity product',
      initialValue: 20,
      min: 1,
      max: 50,
    ),
    description: 'description',
    isBestSeller: false,
    category: 'category',
  );

  NotificationModel notification = NotificationModel(
    uuid: 'uuid',
    title: context.knobs.string(
      label: 'Notification title',
      initialValue: 'We Have New Products With Offers',
    ),
    product: product,
    priceSale: context.knobs.double.slider(
      label: 'Price Sale',
      min: 1,
      max: product.price,
      initialValue: 100,
    ),
    date: 'date',
  );
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardNotification(notification: notification),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Cards',
  type: CardSale,
)
Widget cardSale(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: CardSale(
      title: context.knobs.string(
        label: 'Title Sale',
        initialValue: 'Summer Sales',
      ),
      discount: context.knobs.int.slider(
        label: 'Discount',
        initialValue: 40,
        min: 10,
        max: 90,
      ),
      imagePath: Assets.images.imgSumerSale.path,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Cards',
  type: CardProduct,
)
Widget cardProduct(BuildContext context) {
  ProductModel product = ProductModel(
    uuid: 'uuid',
    name: 'name product',
    imagePath: Assets.images.imgNikeAirMax.path,
    price: 200,
    quantity: context.knobs.int.slider(
      label: 'Quantity product',
      initialValue: 20,
      min: 1,
      max: 50,
    ),
    description: 'description',
    isBestSeller: context.knobs.boolean(label: 'Best Seller'),
    category: 'category',
  );
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardProduct(
              product: product,
              onAddCart: () {},
            ),
          ],
        ),
      ],
    ),
  );
}
