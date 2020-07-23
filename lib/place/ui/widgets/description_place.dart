import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../model/place.dart';
import '../../../user/bloc/bloc_user.dart';
import '../../../widgets/stars_row.dart';
import '../../../widgets/gradient_button.dart';

class DescriptionPlace extends StatelessWidget{

  UserBloc userBloc;

  DescriptionPlace();

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.placeSelectedStream,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          Place place = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              titleStars(place),
              descriptionWidget(place.description),
              GradientButton(
                onPressed: () {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Navegando'))
                  );
                },
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4268D3),
                    Color(0xFF584CD1)
                  ],
                  begin: FractionalOffset(0.2, 0.0),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp
                ),
                text: 'Navigate'
              )
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container (
                margin: EdgeInsets.only(
                  top: 400.0,
                  left: 20.0,
                  right: 20.0
                ),
                child: Text(
                  "Selecciona un lugar",
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget titleStars(Place place) {
    return Row(
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
        StarsRow(4.2, Colors.yellow)
      ],
    );
  }

  Widget descriptionWidget(String description) {
    return Container(
      margin: EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0
      ),
      child: Text(
        description,
        overflow: TextOverflow.clip,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: 16.0,
            color: Colors.black38,
            fontFamily: 'Lato'
        ),
      ),
    );
  }

}