import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../model/user.dart';
import '../../bloc/bloc_user.dart';
import 'profile_header.dart';
import '../widgets/profile_background.dart';
import '../widgets/profile_places_list.dart';

class Profile extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (context, snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
          case ConnectionState.done:
          default:
            return showProfileData(snapshot);
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if(!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              Text("User is not logged, try log in first")
            ],
          ),
        ],
      );
    } else {
      var user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoUrl: snapshot.data.photoUrl
      );

      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(user),
              ProfilePlacesList(user)
            ],
          ),
        ],
      );
    }
  }

}