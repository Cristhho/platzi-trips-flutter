import 'package:flutter/material.dart';

import '../../user/model/user.dart';

class Place {
  String id;
  String name;
  String description;
  String urlImage;
  int likes;

  Place({
    @required this.name,
    @required this.description,
    @required this.urlImage,
    this.likes
  });
}