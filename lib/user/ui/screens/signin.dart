import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../model/user.dart';
import '../../../platzi_trips.dart';
import '../../bloc/bloc_user.dart';
import '../../../widgets/button_green.dart';
import '../../../widgets/gradient_back.dart';

class SignIn extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SignIn();
  }

}

class _SignIn extends State<SignIn> {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentState();
  }

  Widget _handleCurrentState() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData || snapshot.hasError)
          return signInGoogleUi();
        else
          return PlatziTrips();
      },
    );
  }

  Widget signInGoogleUi() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(title: ""),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("Welcome\nThis is your travel app",
                    style: TextStyle(
                        fontSize: 37.0,
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ),
              ),
              ButtonGreen(text: "Login with Gmail",
                onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn().then((FirebaseUser user) {
                    User myUser = User(
                      uid: user.uid,
                      name: user.displayName,
                      email: user.email,
                      photoUrl: user.photoUrl
                    );
                    userBloc.updateUserData(myUser);
                  });
                },
                width: 300.0,
                height: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }

}