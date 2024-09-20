import 'package:flutter/foundation.dart';
import 'models.dart'; // Import your models

class Cart with ChangeNotifier {
  final List<CartItem> _items = [];

  // Getter for items in the cart
  List<CartItem> get items => _items;

  // Add product to the cart
  void addProduct(Product product) {
    final existingItemIndex =
        _items.indexWhere((item) => item.product.id == product.id);
    if (existingItemIndex >= 0) {
      _items[existingItemIndex].quantity +=
          1; // Increment quantity if product already exists
    } else {
      _items.add(CartItem(product: product)); // Add new product to the cart
    }
    notifyListeners(); // Notify listeners of the changes
  }

  // Remove product from the cart
  void removeProduct(Product product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners(); // Notify listeners of the changes
  }

  // Calculate total amount of the cart
  double get totalAmount {
    return _items.fold(
        0.0, (sum, item) => sum + item.product.price * item.quantity);
  }
}
