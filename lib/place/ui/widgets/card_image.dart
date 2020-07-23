import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../widgets/floating_action_button_green.dart';

class CardImage extends StatelessWidget {

  final String imagePath;
  final double height;
  final double width;
  final double left;
  final VoidCallback onPressedFabIcon;
  final IconData icon;
  final bool internet;

  CardImage({
    @required this.imagePath,
    @required this.height,
    @required this.width,
    @required this.onPressedFabIcon,
    @required this.icon,
    @required this.left,
    this.internet
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        left: left
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: internet? CachedNetworkImageProvider(imagePath) : FileImage(File(imagePath))
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]
      ),
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        new FloatingActionButtonGreen(icon: icon, onPressed: onPressedFabIcon,)
      ],
    );
  }

}