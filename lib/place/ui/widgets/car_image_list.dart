import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips/user/model/user.dart';
import '../../model/place.dart';
import 'card_image.dart';
import '../../../user/bloc/bloc_user.dart';

class CardImageList extends StatefulWidget {
  final User user;

  CardImageList({this.user});

  @override
  State<StatefulWidget> createState() {
    return _CardImageList();
  }

}

class _CardImageList extends State<CardImageList> {
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
              return listViewPlaces(userBloc.homePlaces(snapshot.data.documents, widget.user));
          }
        },
      ),
    );
  }

  Widget listViewPlaces(List<Place> places) {
    double width = 250.0;
    double height = 350.0;
    double left = 20.0;
    int index = -1;
    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;

    void setLiked(Place place){
      setState(() {
        place.liked = !place.liked;
        userBloc.likePlace(place, widget.user.uid);
      });
    }

    return ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: places.map((place) {
          index++;
          return CardImage(
            imagePath: place.urlImage,
            width: width,
            height: height,
            left: index == 0 ? 0.0 : left,
            icon: place.liked ? iconDataLiked : iconDataLike,
            onPressedFabIcon: () {
              setLiked(place);
            }
          );
        }).toList()
    );
  }
}