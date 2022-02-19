import 'package:flutter/material.dart';
import './pages/products_detail.dart';
import './models/products.dart';
import './models/cart.dart';
import './pages/home.dart';
import 'package:provider/provider.dart';
import './pages/cart_page.dart';
import './models/order.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Product(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        theme: ThemeData(
          primaryColor: Colors.teal,
          accentColor: Colors.white,
        ),
        home: HomePage(),
        routes: {
          ProductsDetails.routeName: (ctx) => ProductsDetails(),
          CartPage.routeName: (ctx) => CartPage(),
        },
      ),
    );
  }
}
