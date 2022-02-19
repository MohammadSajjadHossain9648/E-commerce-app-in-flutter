import 'package:flutter/material.dart';
import './category_card.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryCard(
            Icon(
              Icons.book,
              size: 40.0,
            ),
            'Book',
          ),
          CategoryCard(
            Icon(
              Icons.computer,
              size: 40.0,
            ),
            'Laptop',
          ),
          CategoryCard(
            Icon(
              Icons.videogame_asset,
              size: 40.0,
            ),
            'Games',
          ),
          CategoryCard(
            Icon(
              Icons.videocam,
              size: 40.0,
            ),
            'Movies',
          ),
          CategoryCard(
            Icon(
              Icons.watch,
              size: 40.0,
            ),
            'Watches',
          ),
          CategoryCard(
            Icon(
              Icons.weekend,
              size: 40.0,
            ),
            'Furniture',
          ),
        ],
      ),
    );
  }
}
