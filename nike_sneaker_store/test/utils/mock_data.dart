import 'package:nike_sneaker_store/models/notification_model.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/utils/maths.dart';

class MockData {
  static List<ProductModel> mockProducts = [
    ProductModel(uuid: Maths.randomUUid(length: 4), name: 'Product 1'),
  ];

  static ProductModel mockProduct = ProductModel(
      uuid: Maths.randomUUid(length: 4), name: 'Product 1', isFavorite: true);

  static List<NotificationModel> mockNotifications = [
    NotificationModel(
      uuid: Maths.randomUUid(length: 4),
      title: 'Notification 1',
      product: mockProducts[0],
    )
  ];
}
