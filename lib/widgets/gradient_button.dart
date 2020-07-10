import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {

  final Gradient gradient;
  final String text;
  final VoidCallback onPressed;

  GradientButton({
    this.gradient, this.text, this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30.0,
        left: 20.0,
        right: 20.0
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 50.0,
          width: 180.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: this.gradient
          ),
          child: Center(
            child: Text(
              this.text,
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Lato',
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }

}