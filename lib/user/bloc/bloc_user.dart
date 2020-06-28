import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../repository/auth_repository.dart';

class UserBloc implements Bloc {

  final _auth_repossitory = AuthRepository();

  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  Future<FirebaseUser> signIn() {
    return _auth_repossitory.signInFirebase();
  }

  signOut() {
    _auth_repossitory.signOut();
  }

  @override
  void dispose() {

  }

}