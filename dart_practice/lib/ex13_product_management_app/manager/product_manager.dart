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
    BaseModel base = BaseModel(products: data);
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
    for (ProductModel product in _products) {
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
    for (ProductModel product in _carts) {
      print(product);
    }
  }

  // add product to cart
  Future<void> addCart() async {
    for (int i = 0; i < _products.length; i++) {
      print('${i + 1}: ${_products[i]}');
    }

    int i;
    do {
      i = Validators.inputInt('Choice: ');
    } while (i < 1 || i > _products.length);

    int quantity = Validators.inputPositiveInt(
      'Enter the quantity you want to add: ',
    );
    if ((_products[i - 1].quantity - quantity) < 0) {
      print('Not enough product to add');
      return;
    }
    _products[i - 1].quantity = _products[i - 1].quantity - quantity;
    saveProducts(Constants.productDataPath, _products);
    ProductModel productCart = ProductModel.parameters(
      name: _products[i - 1].name,
      price: _products[i - 1].price,
      quantity: quantity,
      detail: _products[i - 1].detail,
      note: _products[i - 1].note,
    );
    _carts.add(productCart);
    saveProducts(Constants.cartDataPath, _carts);
    await Future.delayed(const Duration(milliseconds: 500), () {});
    print('Add product to cart successfully');
  }

  // add product
  Future<bool> createProduct() async {
    print('Create new Product.');
    ProductModel product = ProductModel.input();
    _products.add(product);
    saveProducts(Constants.productDataPath, _products);
    await Future.delayed(const Duration(milliseconds: 500), () {});
    return true;
  }

  // Update product
  Future<bool> editProduct() async {
    String uuid = Validators.inputString('Enter the uuid you want to edit: ');
    for (ProductModel product in _products) {
      if (product.uuid == uuid) {
        product.editInformation();
        saveProducts(Constants.productDataPath, _products);
        await Future.delayed(const Duration(milliseconds: 500), () {});
        return true;
      }
    }

    return false;
  }

  // Delete Product from List product by uuid
  Future<void> deleteProduct() async {
    String uuid = Validators.inputString('Enter the uuid you want to delete: ');
    for (ProductModel product in _products) {
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
    String name =
        Validators.inputString('Enter the product name you want to search: ');

    List<ProductModel> listSearch = _products
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
