import 'package:flutter/material.dart';
import 'package:onlinestore/cover_page.dart';
import 'package:onlinestore/screen/cart_page.dart';
import 'package:onlinestore/screen/product_list_page.dart';
import 'package:provider/provider.dart';
import 'cart.dart'; // Import your cart provider

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        title: 'Online Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor:
              Colors.white, // Set global background color here
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF00A368), // Set AppBar background color
          ),
          // You can also customize other theme properties here
        ),
        home: Coverpage(),
        routes: {
          '/cart': (context) => CartPage(),
        },
      ),
    );
  }
}
