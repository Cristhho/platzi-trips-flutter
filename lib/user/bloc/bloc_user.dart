import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../place/repository/firebase_storage_repository.dart';
import '../model/user.dart';
import '../repository/cloud_firestore_repository.dart';
import '../repository/auth_repository.dart';
import '../../place/model/place.dart';

class UserBloc implements Bloc {

  final _auth_repossitory = AuthRepository();
  final _firebaseStorageRepository = FirebaseStorageRepository();

  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  Future<FirebaseUser> signIn() {
    return _auth_repossitory.signInFirebase();
  }

  signOut() {
    _auth_repossitory.signOut();
  }

  final _cloudFirestoreRepository = CloudFirestoreRepository();

  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);

  Future<void> updatePlace(Place place) => _cloudFirestoreRepository.updatePlace(place);

  Future<StorageUploadTask> uploadFile(String path, File image)
      => _firebaseStorageRepository.uploadFile(path, image);

  @override
  void dispose() {

  }

}