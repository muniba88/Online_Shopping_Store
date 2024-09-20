import 'package:flutter/material.dart';
import 'package:onlinestore/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          Consumer<Cart>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      // Do nothing since we're already on the CartPage
                    },
                  ),
                  if (cart.items.isNotEmpty)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${cart.items.length}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final cartItem = cart.items[index];
                return ListTile(
                  leading: Image.network(
                    // Show product image here
                    cartItem.product.imageUrl,
                    fit: BoxFit.cover,
                    width: 50, // Set desired image width
                    height: 50, // Set desired image height
                  ),
                  title: Text(
                    cartItem.product.name,
                    style: TextStyle(
                      color: Color(
                          0xFF00A368), // Set the product name color to blue
                    ),
                  ),
                  subtitle: Text(
                    '\$${cartItem.product.price.toStringAsFixed(2)} x ${cartItem.quantity}',
                    style: TextStyle(
                      color: Color(
                          0xFF00A368), // Set the product price color to blue
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      cart.removeProduct(cartItem.product);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${cart.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                  color:
                      Color(0xFF00A368), // Set the total amount color to blue
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
