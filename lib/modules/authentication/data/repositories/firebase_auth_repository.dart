import 'package:easeup/modules/authentication/data/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository {
  final FirebaseAuthService _fbAuthService = FirebaseAuthService();

  Stream<User?> checkAuthStatus() {
    return _fbAuthService.checkAuthState();
  }

  Future signInUser(String email, String password) async {
    return _fbAuthService.signInUser(email, password);
  }
}
