import 'package:nike_sneaker_store/models/product_model.dart';

class NotificationModel {
  /// Object notification
  ///
  /// include
  /// [uuid], [title], [product], [priceSale], [date], arguments must not be null
  /// and [isRead] argument has default value is false
  NotificationModel({
    required this.uuid,
    required this.title,
    required this.product,
    required this.priceSale,
    required this.date,
    this.isRead = false,
  });

  /// uuid of [NotificationModel] , argument must not be duplicated
  String uuid;

  /// Title of notification
  String title;

  /// The [product] is represents of the [NotificationModel]
  ProductModel product;

  /// Price when product sale
  double priceSale;

  /// Status of [NotificationModel] has been read or not
  bool isRead;

  /// The time the notification is sent
  String date;
}
