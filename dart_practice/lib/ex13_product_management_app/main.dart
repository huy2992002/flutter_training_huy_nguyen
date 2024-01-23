import 'package:dart_practice/ex13_product_management_app/manager/product_manager.dart';
import 'package:dart_practice/ex13_product_management_app/models/base_model.dart';
import 'package:dart_practice/ex13_product_management_app/models/product_model.dart';
import 'package:dart_practice/utils/constants.dart';
import 'package:dart_practice/utils/services.dart';
import 'package:dart_practice/utils/validators.dart';

void main(List<String> args) async {
  final productData = Services.getDataJson(Constants.productDataPath);
  final productBase = BaseModel.fromJson(productData);

  final cartData = Services.getDataJson(Constants.cartDataPath);
  final cartBase = BaseModel.fromJson(cartData);

  final productManager =
      ProductManager(productBase.products, cartBase.products);

  int i;

  do {
    productManager.printMenu();
    do {
      i = Validators.inputInt('Choice: ');
      if (i < 1 || i > 9) print('Please enter from 1 to 9 !!!');
    } while (i < 1 || i > 9);

    switch (i) {
      case 1:
        await productManager.showAllListProducts();
      case 2:
        bool check = await productManager.createProduct();
        if (check) {
          print('Create product successfully !!!');
        } else {
          print('The product is already available');
        }
      case 3:
        bool checkUpdate = await productManager.editProduct();
        if (checkUpdate) {
          print('Edit product successfully !!!');
        } else {
          print('Could not find product uuid to edit.');
          print('Edit product failed !!!');
        }
      case 4:
        bool checkDelete = await productManager.deleteProduct();
        if (checkDelete) {
          print('Delete product successfully !!!');
        } else {
          print('Could not find product id to delete.');
          print('Delete product failed !!!');
        }
      case 5:
        List<ProductModel> listSearch = productManager.searchProduct();

        if (listSearch.isEmpty) {
          print('Cannot find product.');
        } else {
          print('List of products found: ');
          listSearch.forEach(print);
        }
      case 6:
        int total = productManager.countTotalProducts();
        print('Total products in the list is $total');
      case 7:
        await productManager.addCart();
      case 8:
        await productManager.showAllListCart();
      case 9:
        print('Program is finished');
    }
  } while (i != 9);
}
