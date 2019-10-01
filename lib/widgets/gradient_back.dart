import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {

  final String title;

  GradientBack({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4268D3),
            Color(0xFF584CD1)
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp
        )
      ),
      child: Text(
        this.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w800
        ),
      ),
      alignment: Alignment(-0.9, -0.6),
    );
  }
  
}