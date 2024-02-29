import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/services/local/shared_pref.dart';
import 'package:nike_sneaker_store/utils/maths.dart';

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

/// Fetch data list [NotificationModel]
List<NotificationModel> notifications = [
  NotificationModel(
    uuid: Maths.randomUUid(length: 6),
    title: SharedPrefs.isVietnamese
        ? 'Chúng tôi có sản phẩm mới kèm theo ưu đãi'
        : 'We Have New Products With Offers',
    product: products[0],
    priceSale: 250,
    date: '2024-02-23',
  ),
  NotificationModel(
    uuid: Maths.randomUUid(length: 6),
    title: SharedPrefs.isVietnamese
        ? 'Chúng tôi có sản phẩm mới kèm theo ưu đãi'
        : 'We Have New Products With Offers',
    product: products[4],
    priceSale: 280,
    date: '2024-02-22',
  ),
  NotificationModel(
    uuid: Maths.randomUUid(length: 6),
    title: SharedPrefs.isVietnamese
        ? 'Chúng tôi có sản phẩm mới kèm theo ưu đãi'
        : 'We Have New Products With Offers',
    product: products[2],
    priceSale: 290,
    date: '2024-02-19',
  ),
];
