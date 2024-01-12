void main(List<String> args) {
  ProductManager pr = ProductManager();
  pr.addProduct(); // add product success
}

interface class Product {
  void addProduct() {
    print('add product');
  }

  void updateProduct() {}
  void deleteProduct() {}
  void searchProduct() {}
}

// class Product Manager implements Product obligatory override all method in Product
class ProductManager implements Product {
  @override
  void addProduct() {
    print('add product success');
  }

  @override
  void deleteProduct() {}

  @override
  void searchProduct() {}

  @override
  void updateProduct() {}
}
