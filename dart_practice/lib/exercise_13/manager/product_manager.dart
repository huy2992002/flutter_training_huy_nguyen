import 'package:dart_practice/exercise_13/models/base_model.dart';
import 'package:dart_practice/exercise_13/models/product_model.dart';
import 'package:dart_practice/utils/constants.dart';
import 'package:dart_practice/utils/services.dart';
import 'package:dart_practice/utils/validators.dart';

class ProductManager {
  ProductManager(this._products, this._carts);
  final List<ProductModel> _products;
  final List<ProductModel> _carts;

  void saveProducts(String path, List<ProductModel> data) {
    final base = BaseModel(products: data);
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
    print('7. Add product to cart.');
    print('8. Show product in cart.');
    print('9. Exit.');
  }

  void showAllListProducts() {
    if (_products.isEmpty) {
      print('There are no products');
      return;
    }
    print('All List products: ');
    for (final product in _products) {
      print(product);
    }
  }

  void showAllListCart() {
    if (_carts.isEmpty) {
      print('There are no products in cart');
      return;
    }
    print('All List carts: ');
    for (final product in _carts) {
      print(product);
    }
  }

  void addCart() {
    showAllListProducts();
    while (true) {
      final uuid = Validators.inputString(
        "Enter the product uuid you want to add / Enter 'exit' to exit : ",
      );
      if (uuid.toLowerCase() == 'exit') return;
      var isFound = false;
      for (final product in _products) {
        if (product.uuid == uuid) {
          isFound = true;
          print(product);
          final quantity =
              Validators.inputPositiveInt('Enter the quantity you want to add: ');
          if ((product.quantity - quantity) < 0) {
            print('Not enough product to add');
            break;
          }
          product.quantity = product.quantity - quantity;
          saveProducts(Constants.productDataPath, _products);
          final productCart = ProductModel.parameters(
            name: product.name,
            price: product.price,
            quantity: quantity,
          );
          _carts.add(productCart);
          saveProducts(Constants.cartDataPath, _carts);
          print('Add product to cart successfully');
        }
      }
      if (!isFound) print('Product uuid not found');
    }
  }

  void createProduct() {
    print('Create new Product.');
    final product = ProductModel()..inputInformation();
    _products.add(product);
    saveProducts(Constants.productDataPath, _products);
    print('Create Product successfully !!!');
  }

  void editProduct() {
    showAllListProducts();
    final uuid = Validators.inputString('Enter the uuid you want to edit: ');
    for (final product in _products) {
      if (product.uuid == uuid) {
        product.inputInformation();
        print('Edit product successfully!!!');
        saveProducts(Constants.productDataPath, _products);
        return;
      }
    }

    print('Could not find product uuid to edit.');
  }

  void deleteProduct() {
    showAllListProducts();
    final uuid = Validators.inputString('Enter the uuid you want to delete: ');
    for (final product in _products) {
      if (product.uuid == uuid) {
        _products.remove(product);
        print('Delete product successfully!!!');
        saveProducts(Constants.productDataPath, _products);
        return;
      }
    }

    print('Could not find product id to delete.');
  }

  void searchProduct() {
    final name =
        Validators.inputString('Enter the product name you want to search: ');

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
