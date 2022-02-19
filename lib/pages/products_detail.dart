import 'package:flutter/material.dart';
import '../models/products.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class ProductsDetails extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    //productId data comes from product_item.dart ontap function.
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPtd = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPtd.name),
      ),
      body: Column(
        children: [
          Container(
            height: 300.0,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Image.network(loadedPtd.imgurl),
            ),
          ),
          Text(
            'Price: \$ ${loadedPtd.price}',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              '${loadedPtd.description}',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cart.addItem(productId, loadedPtd.name, loadedPtd.price);
        },
        child: Icon(
          Icons.shopping_cart,
          size: 30.0,
        ),
      ),
    );
  }
}
