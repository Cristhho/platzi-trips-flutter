import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../bloc/bloc_user.dart';

class ProfilePlacesList extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: StreamBuilder(
          stream: userBloc.placesStream,
          builder: (context, snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return CircularProgressIndicator();
              case ConnectionState.done:
              case ConnectionState.active:
              default:
                return Column(
                  children: userBloc.buildPlaces(snapshot.data.documents)
                );
            }
          }
        )
    );
  }

}