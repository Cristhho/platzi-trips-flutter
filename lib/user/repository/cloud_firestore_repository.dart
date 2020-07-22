import 'package:cloud_firestore/cloud_firestore.dart';
import '../ui/widgets/profile_place.dart';
import '../model/user.dart';
import 'cloud_firestore_api.dart';
import '../../place/model/place.dart';
import '../../place/ui/widgets/card_image.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlace(Place place) => _cloudFirestoreAPI.updatePlace(place);

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> places) => _cloudFirestoreAPI.buildPlaces(places);
  List<CardImage> homePlaces(List<DocumentSnapshot> places) => _cloudFirestoreAPI.homePlaces(places);
}