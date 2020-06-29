import '../../place/model/place.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final List<Place> myPlaces;
  final List<Place> myFavoritesPlaces;

  User({
    this.uid, this.name, this.email, this.photoUrl,
    this.myPlaces, this.myFavoritesPlaces
  });

}