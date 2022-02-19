import 'package:Ecommerce_app/widgets/home_body.dart';
import 'package:flutter/material.dart';
import './cart_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //open for navigator menu in the top
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('E-commerce Site'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 30.0,
            ),
            onPressed: () =>
                Navigator.of(context).pushNamed(CartPage.routeName),
          ),
        ],
      ),
      body: HomeBody(),
    );
  }
}
