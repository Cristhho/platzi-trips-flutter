import 'package:flutter/material.dart';
import 'profile_header.dart';
import '../widgets/profile_background.dart';
import '../widgets/profile_places_list.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(),
            ProfilePlacesList()
          ],
        ),
      ],
    );
  }

}