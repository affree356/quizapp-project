import 'package:firebase_auth/firebase_auth.dart';


class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailandPass(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print('some error occured');
    }
    return null;
  }

  Future<User?> signInWithEmailandPass(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print('some error occured');
    }
    return null;
  }

  final user = FirebaseAuth.instance;
}
