import 'dart:io';
import 'package:flutter/material.dart';
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
              )
            ],
          )
        ],
      ),
    );
  }
}
