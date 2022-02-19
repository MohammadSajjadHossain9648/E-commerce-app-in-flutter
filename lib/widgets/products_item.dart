import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/products.dart';
import '../pages/products_detail.dart';
import '../models/cart.dart';

class ProductsItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  ProductsItem({this.name, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductsDetails.routeName, arguments: pdt.id);
      },
      child: Padding(
        //this is for home.dart products item padding
        padding: EdgeInsets.all(15.0),
        child: GridTile(
          child: Image.network(imageUrl),
          footer: GridTileBar(
            title: Text(name),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Item Added to Cart'),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.green,
                ));
                cart.addItem(pdt.id, pdt.name, pdt.price);
              },
            ),
            backgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
