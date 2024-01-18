import 'package:dart_practice/exercise_13/models/base_model.dart';
import 'package:dart_practice/exercise_13/models/product_model.dart';
import 'package:dart_practice/utils/services.dart';
import 'package:dart_practice/utils/validator.dart';

class ProductManager {
  ProductManager(this._products);
  final List<ProductModel> _products;

  void saveProducts() {
    const path = 'dart_practice/lib/exercise_13/data/product_data.json';
    final base = BaseModel(products: _products);
    Services.saveDataJson(base.toJson(), path);
  }

  void printMenu() {
    print('Choose one of the options below.');
    print('1. View all list products.');
    print('2. Create product.');
    print('3. Edit product by uuid.');
    print('4. Delete product by uuid.');
    print('5. Search product by name.');
    print('6. Count the total products in the list.');
    print('7. Exit.');
  }

  void showAllListProducts() {
    print('All List products: ');
    for (final product in _products) {
      print(product);
    }
  }

  void createProduct() {
    print('Create new Product.');
    final product = ProductModel()..inputInfomation();
    _products.add(product);
    saveProducts();
    print('Create Product successfully !!!');
  }

  void editProduct() {
    showAllListProducts();
    final uuid = Validator.inputString('Enter the uuid you want to edit: ');
    for (final product in _products) {
      if (product.uuid == uuid) {
        product.inputInfomation();
        print('Edit product successfully!!!');
        saveProducts();
        return;
      }
    }

    print('Could not find product uuid to edit.');
  }

  void deleteProduct() {
    showAllListProducts();
    final uuid = Validator.inputString('Enter the uuid you want to delete: ');
    for (final product in _products) {
      if (product.uuid == uuid) {
        _products.remove(product);
        print('Delete product successfully!!!');
        saveProducts();
        return;
      }
    }

    print('Could not find product id to delete.');
  }

  void searchProduct() {
    final name =
        Validator.inputString('Enter the product name you want to search: ');

    final listSearch = _products
        .where((e) => e.name.toLowerCase().contains(name.toLowerCase()))
        .toList();

    if (listSearch.isEmpty) {
      print('Cannot find product.');
    } else {
      print('List of products found: ');
      listSearch.forEach(print);
    }
  }

  void countTotalProducts() {
    print('Total products in the list is ${_products.length}');
  }
}
