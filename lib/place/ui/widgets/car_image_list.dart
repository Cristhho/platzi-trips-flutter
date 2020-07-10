import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.0,
      margin: EdgeInsets.only(top: 80.0),
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage(
            imagePath: "assets/img/beach.jpeg",
            width: 250.0, height: 350.0, icon: Icons.favorite_border, left: 0.0,
          ),
          CardImage(
            imagePath: "assets/img/beach_palm.jpeg",
            width: 250.0, height: 350.0, icon: Icons.favorite_border, left: 20.0,
          ),
          CardImage(
            imagePath: "assets/img/mountain.jpeg",
            width: 250.0, height: 350.0, icon: Icons.favorite_border, left: 20.0,
          ),
          CardImage(
            imagePath: "assets/img/mountain_stars.jpeg",
            width: 250.0, height: 350.0, icon: Icons.favorite_border, left: 20.0,
          ),
          CardImage(
            imagePath: "assets/img/river.jpeg",
            width: 250.0, height: 350.0, icon: Icons.favorite_border, left: 20.0,
          ),
          CardImage(
            imagePath: "assets/img/sunset.jpeg",
            width: 250.0, height: 350.0, icon: Icons.favorite_border, left: 20.0,
          ),
        ],
      ),
    );
  }

}