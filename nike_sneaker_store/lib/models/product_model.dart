class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.quantity,
    required this.description,
    required this.isBestSeller,
    this.isFavorite = false,
  });

  String id;
  String name;
  String imagePath;
  double price;
  int quantity;
  String description;
  bool isBestSeller;
  bool isFavorite;
}
