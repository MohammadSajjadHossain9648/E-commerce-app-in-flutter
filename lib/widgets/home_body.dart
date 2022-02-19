import 'package:flutter/material.dart';
import '../widgets/all_products.dart';
import '../widgets/category.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 10.0),
        Center(
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Category(),
        SizedBox(height: 10.0),
        Center(
          child: Text(
            'Products',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 400.0,
          child: AllProducts(),
        ),
      ],
    );
  }
}
