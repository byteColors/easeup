import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> checkAuthState() {
    return _auth.authStateChanges();
  }

  Future<UserCredential> createUser(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signInUser(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOutUser() async {
    await _auth.signOut();
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    return _auth.sendPasswordResetEmail(
      email: email,
    );
  }

//
}
