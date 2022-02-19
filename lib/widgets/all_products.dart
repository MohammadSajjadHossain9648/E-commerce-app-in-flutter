import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/products.dart';
import './products_item.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pdts = Provider.of<Products>(context).items;
    return GridView.builder(
      //first find & add provider in pub.dev
      physics: ScrollPhysics(),
      //skrinwrap for visible home.dart page because body part is in home_body.dart which not connect with here
      shrinkWrap: true,
      itemCount: pdts.length,
      //gridDelegate helps to show 2 things in product each row
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: pdts[i],
        child: ProductsItem(
          name: pdts[i].name,
          imageUrl: pdts[i].imgurl,
        ),
      ),
    );
  }
}
