import 'package:flutter/material.dart';
import '../../model/place_description.dart';
import '../../../widgets/stars_row.dart';
import '../../../widgets/gradient_button.dart';

class DescriptionPlace extends StatelessWidget{

  final PlaceDescription place;

  DescriptionPlace(this.place);

  @override
  Widget build(BuildContext context) {

    final titleStars = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0
          ),
          child: Text(
            place.name,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w800,
              fontFamily: 'Lato'
            ),
            textAlign: TextAlign.left,
          ),
        ),
        StarsRow(this.place.stars, Colors.yellow)
      ],
    );
    
    final description = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0
      ),
      child: Text(
        place.description,
        overflow: TextOverflow.clip,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black38,
          fontFamily: 'Lato'
        ),
      ),
    );

    final placeDescription = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        titleStars,
        description,
        new GradientButton(
        LinearGradient(
          colors: [
            Color(0xFF4268D3),
            Color(0xFF584CD1)
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp
        ),
        'Navigate')
      ],
    );

    return placeDescription;
  }

}