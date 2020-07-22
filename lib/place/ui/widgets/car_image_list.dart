import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'card_image.dart';
import '../../../user/bloc/bloc_user.dart';

class CardImageList extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      height: 270.0,
      margin: EdgeInsets.only(top: 80.0),
      child: StreamBuilder(
        stream: userBloc.placesStream,
        builder: (context, snapshot){
          switch(snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
            default:
              return listViewPlaces(userBloc.homePlaces(snapshot.data.documents));
          }
        },
      ),
    );
  }

  Widget listViewPlaces(List<CardImage> places) {
    return ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: places
    );
  }

}