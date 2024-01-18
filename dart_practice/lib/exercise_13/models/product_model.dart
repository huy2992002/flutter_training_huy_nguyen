import 'package:dart_practice/utils/extension.dart';
import 'package:dart_practice/utils/math.dart';
import 'package:dart_practice/utils/validator.dart';

class ProductModel {
  ProductModel() {
    _uuid = Math.randomUUid(lenght: 6);
  }

  ProductModel.parameters(this._name, this._price) {
    _uuid = Math.randomUUid(lenght: 6);
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel.parameters(
        json['name'] as String, json['price'] as double);
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
    return 'Product ID: $_uuid, Product Name: $_name, Product Price: ${_price.toFomatVnd()}, Quantity: $_quantity';
  }

  void inputInfomation() {
    _name = Validator.inputString('Input name product: ');
    _price = Validator.inputDouble('Input price product: ');
    _quantity = Validator.inputInt('Input quantity: ');
  }
}
