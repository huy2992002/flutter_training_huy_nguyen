import 'package:nike_sneaker_store/gen/assets.gen.dart';
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

List<ProductModel> products = [
  ProductModel(
    uuid: Maths.randomUUid(length: 6),
    name: 'Nike Jordan',
    imagePath: Assets.images.imgNikeJordan.path,
    price: 302,
    quantity: 20,
    description:
        'The Nike Air Jordan 1 Retro High stands as an unmistakable icon in the sneaker world. Originating from the collaboration between Nike and Michael Jordan, this silhouette has transcended its basketball roots to become a staple in fashion, culture, and lifestyle.',
    isBestSeller: true,
    category: 'Outdoor',
  ),
  ProductModel(
    uuid: Maths.randomUUid(length: 6),
    name: 'Nike Air Max',
    imagePath: Assets.images.imgNikeAirMax.path,
    price: 302,
    quantity: 20,
    description:
        'The Nike Air Max 90 is an iconic sneaker that revolutionized the world of athletic footwear. With its distinctive design and pioneering air cushioning technology, this shoe has captivated sneaker enthusiasts, athletes, and fashion-forward individuals for decades.',
    isBestSeller: true,
    category: 'Tennis',
  ),
  ProductModel(
    uuid: Maths.randomUUid(length: 6),
    name: 'Nike Air Max 200',
    imagePath: Assets.images.imgNikeAirMax200.path,
    price: 302,
    quantity: 20,
    description:
        'The Nike Air Max 200 is a modern twist on the classic Air Max legacy, offering a bold, refreshed look while retaining the comfort and performance that fans have come to expect from the Air Max series.',
    isBestSeller: true,
    category: 'Outdoor',
  ),
  ProductModel(
    uuid: Maths.randomUUid(length: 6),
    name: 'Nike Air Max 270',
    imagePath: Assets.images.imgNikeAirMax270.path,
    price: 302,
    quantity: 20,
    description:
        "The Nike Air Max 270 represents a significant milestone in the evolution of the Air Max family, blending classic style with modern technology to create a sneaker that's visually striking and supremely comfortable. Designed to support lifestyle wear rather than sports performance, the Air Max 270 draws inspiration from the Air Max lineage, showcasing Nike's biggest heel Air unit yet.",
    isBestSeller: true,
    category: 'Outdoor',
  ),
  ProductModel(
    uuid: Maths.randomUUid(length: 6),
    name: 'Nike Club Max',
    imagePath: Assets.images.imgNikeAirMax270.path,
    price: 302,
    quantity: 20,
    description:
        "The Nike Club Max represents a significant milestone in the evolution of the Air Max family, blending classic style with modern technology to create a sneaker that's visually striking and supremely comfortable. Designed to support lifestyle wear rather than sports performance, the Air Max 270 draws inspiration from the Air Max lineage, showcasing Nike's biggest heel Air unit yet.",
    isBestSeller: true,
    category: 'Tennis',
  ),
];

List<ProductModel> myCarts = [];
