import 'models/product.dart';

class Cart {
  static final List<Product> _products = [];

  static void addProduct(Product product) {
    _products.add(product);
  }

  static void removeProduct(Product product) {
    _products.remove(product);
  }

  static void clearCart() {
    _products.clear();
  }

  static List<Product> get products => _products;
}
