import '../model/user.dart';
import 'cloud_firestore_api.dart';
import '../../place/model/place.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlace(Place place) => _cloudFirestoreAPI.updatePlace(place);
}