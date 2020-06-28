import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips/user/bloc/bloc_user.dart';
import 'platzi_trips.dart';
import 'user/ui/screens/signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final String desc = 'Lorem ipsum dolor sit amet, consectetur adipiscing '
      'elit. Etiam at maximus justo, eget pulvinar erat. Nullam consequat '
      'efficitur ante vitae imperdiet.\n\nProin quis bibendum justo. Morbi '
      'convallis justo ac dapibus bibendum. Integer iaculis tortor est, vel '
      'elementum neque volutpat sed.';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: SignIn()
      ),
      bloc: UserBloc()
    );
  }
}
