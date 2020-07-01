import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "places";

  final Firestore _db = Firestore.instance;

  Future<void> updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'myPlaces': user.myPlaces,
      'myFavoritesPlaces': user.myFavoritesPlaces,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }
}