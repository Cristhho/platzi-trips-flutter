import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/card_image.dart';
import '../widgets/text_input_location.dart';
import '../../../widgets/text_input.dart';
import '../../../widgets/title_header.dart';
import '../../../widgets/gradient_back.dart';

class AddPlaceScreen extends StatefulWidget {

  final File image;

  AddPlaceScreen({this.image});

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {

    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: 250.0,),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  width: 45.0,
                  height: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 45.0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                  child: TitleHeader(title: "Add a new place")
                )
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImage(
                    imagePath: "assets/img/beach.jpeg",
                    icon: Icons.camera_alt,
                    width: 350.0,
                    height: 250.0,
                    left: 0.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0, top: 40.0),
                  child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    controller: _controllerTitlePlace,
                  ),
                ),
                TextInput(
                  hintText: "Description",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerDescriptionPlace,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText: "Add location",
                    icon: Icons.location_on,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
