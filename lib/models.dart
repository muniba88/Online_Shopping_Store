class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl; // Add this line

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl, // Add this line
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
