import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../../user/bloc/bloc_user.dart';
import '../../../user/model/user.dart';
import '../../../widgets/gradient_back.dart';
import '../widgets/car_image_list.dart';

class HeaderAppBar extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.active:
          case ConnectionState.done:
          default:
            return showPlacesData(snapshot);
        }
      },
    );
  }

  Widget showPlacesData(AsyncSnapshot snapshot) {
    if(!snapshot.hasData || snapshot.hasError)
      return Stack(
        children: [
          GradientBack(height: 250.0),
          Text("Usuario no logeado. Haz Login")
        ],
      );
    else {
      User user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoUrl: snapshot.data.photoUrl
      );
      return Stack(
        children: [
          GradientBack(height: 250.0),
          CardImageList(user: user)
        ],
      );
    }
  }

}