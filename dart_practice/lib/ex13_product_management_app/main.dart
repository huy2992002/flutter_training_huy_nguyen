import 'package:dart_practice/ex13_product_management_app/manager/product_manager.dart';
import 'package:dart_practice/ex13_product_management_app/models/base_model.dart';
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
        await productManager.createProduct();
      case 3:
        await productManager.editProduct();
      case 4:
        await productManager.deleteProduct();
      case 5:
        productManager.searchProduct();
      case 6:
        productManager.countTotalProducts();
      case 7:
        await productManager.addCart();
      case 8:
        await productManager.showAllListCart();
      case 9:
        print('Program is finished');
    }
  } while (i != 9);
}
