import 'package:dart_practice/ex13_product_management_app/models/base_model.dart';
import 'package:dart_practice/ex13_product_management_app/models/product_model.dart';
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

  // Print menu list
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

  // View all list products 
  Future<void> showAllListProducts() async {
    if (_products.isEmpty) {
      print('There are no products');
      return;
    }
    await Future.delayed(const Duration(seconds: 2), () {});
    print('All List products: ');
    for (final product in _products) {
      print(product);
    }
  }

  // View all list carts 
  Future<void> showAllListCart() async {
    if (_carts.isEmpty) {
      print('There are no products in cart');
      return;
    }
    await Future.delayed(const Duration(seconds: 1), () {});
    print('All List carts: ');
    for (final product in _carts) {
      print(product);
    }
  }

  // add product to cart
  Future<void> addCart() async {
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
          final quantity = Validators.inputPositiveInt(
            'Enter the quantity you want to add: ',
          );
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
            detail: product.detail,
            note: product.note,
          );
          _carts.add(productCart);
          saveProducts(Constants.cartDataPath, _carts);
          await Future.delayed(const Duration(milliseconds: 500), () {});
          print('Add product to cart successfully');
        }
      }
      if (!isFound) print('Product uuid not found');
    }
  }

  // add product
  Future<void> createProduct() async {
    print('Create new Product.');
    final product = ProductModel()..inputInformation();
    _products.add(product);
    saveProducts(Constants.productDataPath, _products);
    await Future.delayed(const Duration(milliseconds: 500), () {});

    print('Create Product successfully !!!');
  }

  // Update product
  Future<void> editProduct() async {
    final uuid = Validators.inputString('Enter the uuid you want to edit: ');
    for (final product in _products) {
      if (product.uuid == uuid) {
        product.inputInformation();
        saveProducts(Constants.productDataPath, _products);
        await Future.delayed(const Duration(milliseconds: 500), () {});
        print('Edit product successfully!!!');
        return;
      }
    }

    print('Could not find product uuid to edit.');
  }

  // Delete Product from List product by uuid
  Future<void> deleteProduct() async {
    final uuid = Validators.inputString('Enter the uuid you want to delete: ');
    for (final product in _products) {
      if (product.uuid == uuid) {
        _products.remove(product);
        print('Delete product successfully!!!');
        saveProducts(Constants.productDataPath, _products);
        await Future.delayed(const Duration(milliseconds: 500), () {});
        print('Delete product successfully!!!');
        return;
      }
    }

    print('Could not find product id to delete.');
  }

  // Search product by name
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

  // count total product in list
  void countTotalProducts() {
    print('Total products in the list is ${_products.length}');
  }
}
