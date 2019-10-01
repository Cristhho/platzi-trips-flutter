import 'package:flutter/material.dart';
import 'star.dart';

class StarsRow extends StatelessWidget {
  final double _starsNumber;
  final Color _starColor;

  StarsRow(this._starsNumber, this._starColor);

  @override
  Widget build(BuildContext context) {
    final List<Widget> starsRow = [];
    final totalStarts = this._starsNumber.ceil();

    for(int i=1; i <= 5; i++) {
      if(i <  totalStarts) {
        starsRow.add(new Star(Icons.star, this._starColor));
      } else if(i > totalStarts) {
        starsRow.add(new Star(Icons.star_border, this._starColor));
      } else{
        if(this._starsNumber % 1 == 0) {
          starsRow.add(new Star(Icons.star, this._starColor));
        } else {
          starsRow.add(new Star(Icons.star_half, this._starColor));
        }
      }
    }

    final starsContainer = Container(
      margin: EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),
      child: Row(
        children: starsRow,
      ),
    );
    return starsContainer;
  }

}