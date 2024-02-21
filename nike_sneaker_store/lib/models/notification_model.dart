import 'package:nike_sneaker_store/models/product_model.dart';

class NotificationModel {
  NotificationModel({
    required this.uuid,
    required this.title,
    required this.product,
    required this.priceSale,
    required this.date,
    this.isRead = false,
  });

  String uuid;
  String title;
  ProductModel product;
  double priceSale;
  bool isRead;
  String date;
}
