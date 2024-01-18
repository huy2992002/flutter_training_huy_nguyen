import 'package:dart_practice/utils/extension.dart';
import 'package:dart_practice/utils/math.dart';
import 'package:dart_practice/utils/validator.dart';

class ProductModel {
  ProductModel() {
    _uuid = Math.randomUUid(length: 6);
  }

  ProductModel.parameters({
    required String name,
    required double price,
    required int quantity,
    String? uuid,
  }) {
    _uuid = uuid ?? Math.randomUUid(length: 6);
    _name = name;
    _price = price;
    _quantity = quantity;
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel.parameters(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      price: json['price'] as double,
      quantity: json['quantity'] as int,
    );
  }

  String _uuid = '';
  String _name = '';
  double _price = 0;
  int _quantity = 0;

  Map<String, dynamic> toJson() {
    return {
      'uuid': _uuid,
      'name': _name,
      'price': _price,
      'quantity': _quantity,
    };
  }

  String get uuid => _uuid;

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  double get price => _price;

  set price(double price) {
    _price = price;
  }

  int get quantity => _quantity;

  set quantity(int price) {
    _quantity = price;
  }

  @override
  String toString() {
    return 'Product ID: $_uuid, Product Name: $_name, Product Price: ${_price.toFormatVnd()}, Quantity: $_quantity';
  }

  void inputInformation() {
    _name = Validator.inputString('Input name product: ');
    _price = Validator.inputDouble('Input price product: ');
    _quantity = Validator.inputPositiveInt('Input quantity: ');
  }
}
