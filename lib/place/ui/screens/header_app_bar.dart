import 'package:flutter/material.dart';
import '../../../widgets/gradient_back.dart';
import '../widgets/car_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new  GradientBack(title: 'Popular'),
        new CardImageList()
      ],
    );
  }

}