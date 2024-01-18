import 'package:dart_practice/exercise_13/manager/product_manager.dart';
import 'package:dart_practice/exercise_13/models/base_model.dart';
import 'package:dart_practice/utils/services.dart';
import 'package:dart_practice/utils/validator.dart';

void main(List<String> args) {
  const path = 'dart_practice/lib/exercise_13/data/product_data.json';
  final data = getDataJson(path);
  
  final baseModel = BaseModel.fromJson(data);
  final productManager = ProductManager(baseModel.products);

  int i;

  do {
    productManager.printMenu();
    do {
      i = Validator.inputInt('Choice: ');
      if (i < 1 || i > 7) print('Please enter from 1 to 7 !!!');
    } while (i < 1 || i > 7);

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
        print('Program is finished');
    }
  } while (i != 7);
}
