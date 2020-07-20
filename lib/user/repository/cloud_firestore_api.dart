import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../ui/widgets/profile_place.dart';
import '../../place/model/place.dart';
import '../model/user.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "places";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<void> updatePlace(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);
    FirebaseUser user = await _auth.currentUser();
    DocumentReference userRef = _db.collection(USERS).document(user.uid);
    await _auth.currentUser().then((user) {
      refPlaces.add({
        "name": place.name,
        "description": place.description,
        "likes": place.likes,
        "userOwner": userRef,
        "imageUrl": place.urlImage
      }).then((reference) {
        reference.get().then((snapshot) {
          userRef.updateData({
            'myPlaces': FieldValue.arrayUnion([
              _db.document("$PLACES/${snapshot.documentID}")])
          });
        });
      });
    });
  }

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> places) {
    List<ProfilePlace> profilePlaces = List<ProfilePlace>();
    places.forEach((place) {
      profilePlaces.add(ProfilePlace(
        Place(
          name: place.data['name'],
          description: place.data['description'],
          urlImage: place.data['imageUrl'],
          likes: place.data['likes']
        )
      ));
    });

    return profilePlaces;
  }
}