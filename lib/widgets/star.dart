import 'package:flutter/material.dart';

class Star extends StatelessWidget {

  final IconData _starIcon;
  final Color _starColor;

  Star(this._starIcon, this._starColor);

  IconData get starIcon => _starIcon;

  Color get starColor => _starColor;

  @override
  Widget build(BuildContext context) {
    return Icon(
      this._starIcon,
      color: this._starColor,
    );
  }

}