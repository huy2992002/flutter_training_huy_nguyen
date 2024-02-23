import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/utils/maths.dart';

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

List<NotificationModel> notifications = [
  NotificationModel(
    uuid: Maths.randomUUid(length: 6),
    title: 'We Have New Products With Offers',
    product: products[0],
    priceSale: 250,
    date: '2024-02-23',
  ),
  NotificationModel(
    uuid: Maths.randomUUid(length: 6),
    title: 'We Have New Products With Offers',
    product: products[4],
    priceSale: 280,
    date: '2024-02-22',
  ),
  NotificationModel(
    uuid: Maths.randomUUid(length: 6),
    title: 'We Have New Products With Offers',
    product: products[2],
    priceSale: 290,
    date: '2024-02-19',
  ),
];
