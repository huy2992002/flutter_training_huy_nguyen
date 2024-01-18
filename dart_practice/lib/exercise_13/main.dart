import 'package:dart_practice/exercise_13/manager/product_manager.dart';
import 'package:dart_practice/exercise_13/models/base_model.dart';
import 'package:dart_practice/utils/constants.dart';
import 'package:dart_practice/utils/services.dart';
import 'package:dart_practice/utils/validator.dart';

void main(List<String> args) {
  final productData = Services.getDataJson(Constants.productDataPath);
  final productBase = BaseModel.fromJson(productData);

  final cartData = Services.getDataJson(Constants.cartDataPath);
  final cartBase = BaseModel.fromJson(cartData);

  final productManager = ProductManager(productBase.products, cartBase.products);

  int i;

  do {
    productManager.printMenu();
    do {
      i = Validator.inputInt('Choice: ');
      if (i < 1 || i > 9) print('Please enter from 1 to 9 !!!');
    } while (i < 1 || i > 9);

    switch (i) {
      case 1:
        productManager.showAllListProducts();
      case 2:
        productManager.createProduct();
      case 3:
        productManager.editProduct();
      case 4:
        productManager.deleteProduct();
      case 5:
        productManager.searchProduct();
      case 6:
        productManager.countTotalProducts();
      case 7:
        productManager.addCart();
      case 8:
        productManager.showAllListCart();  
      case 9:
        print('Program is finished');
    }
  } while (i != 9);
}
