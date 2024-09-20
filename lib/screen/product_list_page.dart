import 'package:flutter/material.dart';
import 'package:onlinestore/cart.dart';
import 'package:onlinestore/models.dart';
import 'package:provider/provider.dart';
import 'cart_page.dart'; // Import your cart page

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Red Dress',
      price: 29.99,
      imageUrl: 'images/1.png', // Add image URL
    ),
    Product(
      id: '2',
      name: 'Blue Shoes', // Corrected typo in product name
      price: 19.99,
      imageUrl: 'images/2.png', // Add image URL
    ),
    Product(
      id: '3',
      name: 'Black Bag',
      price: 19.99,
      imageUrl: 'images/3.png', // Add image URL
    ),
    Product(
      id: '4',
      name: 'Red Necklace', // Corrected typo in product name
      price: 19.99,
      imageUrl: 'images/4.png', // Add image URL
    ),
    Product(
      id: '5',
      name: 'Mask',
      price: 19.99,
      imageUrl: 'images/5.png', // Add image URL
    ),
    Product(
      id: '6',
      name: 'Makeup',
      price: 19.99,
      imageUrl: 'images/6.png', // Add image URL
    ),
    Product(
      id: '7',
      name: 'Bear',
      price: 19.99,
      imageUrl: 'images/7.png', // Add image URL
    ),
    Product(
      id: '8',
      name: 'Romper',
      price: 19.99,
      imageUrl: 'images/8.png', // Add image URL
    ),
    Product(
      id: '9',
      name: 'Hat',
      price: 19.99,
      imageUrl: 'images/9.png', // Add image URL
    ),
    Product(
      id: '10',
      name: 'Coat',
      price: 19.99,
      imageUrl: 'images/10.png', // Add image URL
    ),
    Product(
      id: '11',
      name: 'T Shirts',
      price: 19.99,
      imageUrl: 'images/11.png', // Add image URL
    ),
    Product(
      id: '12',
      name: 'White Bag',
      price: 19.99,
      imageUrl: 'images/12.png', // Add image URL
    ),
    Product(
      id: '13',
      name: 'Lipstick',
      price: 19.99,
      imageUrl: 'images/13.png', // Add image URL
    ),
    Product(
      id: '14',
      name: 'Big Box',
      price: 19.99,
      imageUrl: 'images/14.png', // Add image URL
    ),
    Product(
      id: '15',
      name: 'Glasses',
      price: 19.99,
      imageUrl: 'images/15.png', // Add image URL
    ),
    Product(
      id: '16',
      name: 'Toy Phone',
      price: 19.99,
      imageUrl: 'images/16.png', // Add image URL
    ),
    Product(
      id: '17',
      name: 'Bycycle',
      price: 19.99,
      imageUrl: 'images/17.png', // Add image URL
    ),
    Product(
      id: '18',
      name: 'Tricycle',
      price: 19.99,
      imageUrl: 'images/18.png', // Add image URL
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          // Consumer listens to Cart changes and updates the badge count
          Consumer<Cart>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                  if (cart
                      .items.isNotEmpty) // Only show badge if there are items
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
      body: SingleChildScrollView(
        child: Column(
          children: products.map((product) {
            return ListTile(
              leading: Image.network(product.imageUrl),
              title: Text(
                product.name,
                style: TextStyle(
                    color: Color(0xFF00A368), fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                    color: Color(0xFF00A368), fontWeight: FontWeight.bold),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  final cart = Provider.of<Cart>(context, listen: false);
                  cart.addProduct(product);

                  // Show the SnackBar with the updated count
                  final snackBar = SnackBar(
                    content: Text(
                        '${product.name} added to cart! Total items: ${cart.items.length}'),
                    duration: Duration(seconds: 2),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(0xFF00A368), // Change the background color to red
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                      // backgroundColor: Color(0xFF00A368),
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
