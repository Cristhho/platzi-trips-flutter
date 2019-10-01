import 'package:flutter/material.dart';

import '../models/place_description.dart';
import '../widgets/header_app_bar.dart';
import '../review_list.dart';
import '../description_place.dart';

class HomeTrips extends StatelessWidget {

  final String desc = 'Lorem ipsum dolor sit amet, consectetur adipiscing '
      'elit. Etiam at maximus justo, eget pulvinar erat. Nullam consequat '
      'efficitur ante vitae imperdiet.\n\nProin quis bibendum justo. Morbi '
      'convallis justo ac dapibus bibendum. Integer iaculis tortor est, vel '
      'elementum neque volutpat sed.';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            new DescriptionPlace(new PlaceDescription('Bahamas', 4.2, desc)),
            new ReviewList()
          ],
        ),
        new HeaderAppBar()
      ],
    );
  }

}