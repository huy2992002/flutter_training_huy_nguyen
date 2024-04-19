import 'package:nike_sneaker_store/models/product_model.dart';

class NotificationModel {
  /// Object notification
  ///
  /// include
  /// [uuid], [title], [product], [priceSale], [date], arguments must not be null
  /// and [isRead] argument has default value is false
  NotificationModel({
    this.uuid,
    this.title,
    this.product,
    this.priceSale,
    this.date,
    this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      priceSale: double.parse(json['priceSale'].toString()),
      isRead: json['isRead'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'title': title,
      'product': product?.toJson(),
      'priceSale': priceSale,
      'date': date,
      'isRead': isRead,
    };
  }

  /// uuid of [NotificationModel] , argument must not be duplicated
  String? uuid;

  /// Title of notification
  String? title;

  /// The [product] is represents of the [NotificationModel]
  ProductModel? product;

  /// Price when product sale
  double? priceSale;

  /// Status of [NotificationModel] has been read or not
  bool? isRead;

  /// The time the notification is sent
  String? date;
}
