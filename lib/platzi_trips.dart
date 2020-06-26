import 'package:flutter/material.dart';
import 'place/ui/screens/home_trips.dart';
import 'place/ui/screens/search.dart';
import 'user/ui/screens/profile.dart';

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PlatziTrips();
  }

}

class _PlatziTrips extends State<PlatziTrips> {

  int tapIndex = 0;
  final List<Widget> widgetsChildren = [
    HomeTrips(),
    Search(),
    Profile()
  ];

  void onTapTapped(int index) {
    setState(() {
      tapIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[tapIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.purple
        ),
        child: BottomNavigationBar(
          currentIndex: tapIndex,
          onTap: onTapTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            )
          ],
        ),
      ),
    );
  }

}