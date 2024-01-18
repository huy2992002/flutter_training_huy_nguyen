import 'package:dart_practice/utils/extension.dart';
import 'package:dart_practice/utils/math.dart';
import 'package:dart_practice/utils/validator.dart';

class ProductModel {
  ProductModel() {
    _id = Math.randomUUid(lenght: 6);
  }

  ProductModel.parameters(this._name, this._price) {
    _id = Math.randomUUid(lenght: 6);
  }

  String _id = '';
  String _name = '';
  double _price = 0;

  String get id => _id;

  set id(String id) {
    _id = id;
  }

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  double get price => _price;

  set price(double price) {
    _price = price;
  }

  @override
  String toString() {
    return 'Product ID: $_id, Product Name: $_name, Product Price: ${_price.toFomatVnd()}';
  }

  void inputInfomation() {
    _name = Validator.inputString('Input name product: ');
    _price = Validator.inputDouble('Input price product: ');
  }
}

List<ProductModel> initProducts = [
  ProductModel.parameters('Product 1', 100000),
  ProductModel.parameters('Product 2', 200000),
  ProductModel.parameters('Product 3', 200000),
  ProductModel.parameters('Product 4', 300000),
  ProductModel.parameters('Product 5', 400000),
];
