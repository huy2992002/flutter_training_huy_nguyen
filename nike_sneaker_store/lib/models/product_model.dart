import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/utils/maths.dart';

class ProductModel {
  ProductModel({
    required this.uuid,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.quantity,
    required this.description,
    required this.isBestSeller,
    required this.category,
    this.isFavorite = false,
  });

  String uuid;
  String name;
  String imagePath;
  double price;
  int quantity;
  String description;
  bool isBestSeller;
  String category;
  bool isFavorite;
}

List<ProductModel> products(BuildContext context) {
  return [
    ProductModel(
      uuid: Maths.randomUUid(length: 6),
      name: AppLocalizations.of(context).nameNikeJordan,
      imagePath: Assets.images.imgNikeJordan.path,
      price: 302,
      quantity: 20,
      description: AppLocalizations.of(context).descriptionNikeJordan,
      isBestSeller: true,
      category: AppLocalizations.of(context).outDoor,
    ),
    ProductModel(
      uuid: Maths.randomUUid(length: 6),
      name: AppLocalizations.of(context).nameNikeAirMax,
      imagePath: Assets.images.imgNikeAirMax.path,
      price: 302,
      quantity: 20,
      description: AppLocalizations.of(context).descriptionNikeAirMax,
      isBestSeller: true,
      category: AppLocalizations.of(context).outDoor,
    ),
    ProductModel(
      uuid: Maths.randomUUid(length: 6),
      name: AppLocalizations.of(context).nameNikeAirMax200,
      imagePath: Assets.images.imgNikeAirMax200.path,
      price: 302,
      quantity: 20,
      description: AppLocalizations.of(context).descriptionNikeAirMax200,
      isBestSeller: true,
      category: AppLocalizations.of(context).outDoor,
    ),
    ProductModel(
      uuid: Maths.randomUUid(length: 6),
      name: AppLocalizations.of(context).nameNikeAirMax270,
      imagePath: Assets.images.imgNikeAirMax270.path,
      price: 302,
      quantity: 20,
      description: AppLocalizations.of(context).descriptionNikeAirMax270,
      isBestSeller: true,
      category: AppLocalizations.of(context).tennis,
    ),
    ProductModel(
      uuid: Maths.randomUUid(length: 6),
      name: AppLocalizations.of(context).nameNikeClubMax,
      imagePath: Assets.images.imgNikeAirMax270.path,
      price: 302,
      quantity: 20,
      description: AppLocalizations.of(context).descriptionNikeClubMax,
      isBestSeller: true,
      category: AppLocalizations.of(context).tennis,
    ),
  ];
}
