import 'package:flutter/material.dart';
import 'package:onlinestore/screen/product_list_page.dart';
// import 'package:online_store/constants.dart';
// import 'package:online_store/homepage.dart';

class Coverpage extends StatefulWidget {
  const Coverpage({super.key});

  @override
  State<Coverpage> createState() => _CoverpageState();
}

class _CoverpageState extends State<Coverpage> {
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _navigateToWelcome();
  // }

  // void _navigateToWelcome() async {
  //   await Future.delayed(Duration(seconds: 3));

  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => ProductListPage()));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background1.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Text(
            'GirlyGoods',
            style: TextStyle(
                color: Color(0xFF00A368),
                fontSize: 45,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: 500,
          ),
          Text(
            "Buy what ever you want..",
            style: TextStyle(
                color: Color(0xFF00A368),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          TextButton(
            child: Text(
              "Get Started",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListPage()),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              backgroundColor: Color(0xFF00A368), // Text color
            ),
          )
        ],
      ),
    );
  }
}
