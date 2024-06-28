import 'package:easeup/modules/authentication/data/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository {
  final FirebaseAuthService _fbAuthService = FirebaseAuthService();

  Stream<User?> checkAuthStatus() {
    return _fbAuthService.checkAuthState();
  }

  Future registerUser({
    required String email,
    required String password,
  }) {
    return _fbAuthService.createUser(email, password);
  }

  Future loginUser({
    required String email,
    required String password,
  }) async {
    return _fbAuthService.signInUser(email, password);
  }

  Future<void> logoutUser() {
    return _fbAuthService.signOutUser();
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    return _fbAuthService.resetPassword(
      email: email,
    );
  }

// END
}
