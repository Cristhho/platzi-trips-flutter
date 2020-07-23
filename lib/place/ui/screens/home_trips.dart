import 'package:flutter/material.dart';

import '../../model/place_description.dart';
import 'header_app_bar.dart';
import '../widgets/review_list.dart';
import '../widgets/description_place.dart';

class HomeTrips extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            new DescriptionPlace(),
            new ReviewList()
          ],
        ),
        new HeaderAppBar()
      ],
    );
  }

}