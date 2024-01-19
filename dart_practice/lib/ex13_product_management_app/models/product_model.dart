import 'package:dart_practice/utils/extension.dart';
import 'package:dart_practice/utils/maths.dart';
import 'package:dart_practice/utils/validators.dart';

class ProductModel {
  ProductModel() {
    _uuid = Maths.randomUUid(length: 6);
  }

  ProductModel.parameters({
    required String name,
    required double price,
    required int quantity,
    required String detail,
    String? note,
    String? uuid,
  }) {
    _uuid = uuid ?? Maths.randomUUid(length: 6);
    _name = name;
    _price = price;
    _quantity = quantity;
    _detail = detail;
    _note = note;
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel.parameters(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      price: json['price'] as double,
      quantity: json['quantity'] as int,
      detail: json['detail'] as String,
      note: json['note'] as String?,
    );
  }

  String _uuid = '';
  String _name = '';
  double _price = 0;
  int _quantity = 0;
  String _detail = '';
  String? _note;

  Map<String, dynamic> toJson() {
    return {
      'uuid': _uuid,
      'name': _name,
      'price': _price,
      'quantity': _quantity,
      'detail': _detail,
      'note': _note,
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

  String get detail => _detail;

  set detail(String detail) {
    _detail = detail;
  }

  String? get note => _note;

  set note(String? note) {
    _note = note;
  }

  @override
  String toString() {
    return 'Product ID: $_uuid, Product Name: $_name, Product Price: ${_price.toFormatVnd()}, Quantity: $_quantity, Detail: $_detail${_note != null ? ', Note: $_note' : ''}';
  }

  void inputInformation() {
    _name = Validators.inputString('Input name product: ');
    _price = Validators.inputDouble('Input price product: ');
    _quantity = Validators.inputPositiveInt('Input quantity: ');
    _detail = Validators.inputString('Input Detail: ');
    _note = Validators.inputStringCanNull('Input Note: ');
  }
}
