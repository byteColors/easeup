import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthenticationViewModel extends ChangeNotifier {
  // Private Properties (data available locally)
  bool _isLoading = true;
  User? _currentUser;
  String _errorMessage = '';

  // Getters (Private properties data exposed to the View)
  bool get isLoading => _isLoading;
  User? get currentUser => _currentUser;
  String get errorMessage => _errorMessage;

  final FirebaseAuth _fbAuth = FirebaseAuth.instance;
final FirebaseAuthRepository _fbAuthRepo = FirebaseAuthRepository();

  // Constructor: ensures that the ViewModel listening to
  //  auth state changes immediately upon creation.
  AuthenticationViewModel() {
    // Initialize the auth state
    _initializeAuthState();
    checkCurrentUser();
  }

  // Method: Initialize the auth state
  void _initializeAuthState() {
    _fbAuth.authStateChanges().listen(
      (User? user) {
        _currentUser = user;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> checkCurrentUser() async {
    _currentUser = _fbAuth.currentUser;
    _isLoading = false;
    notifyListeners();
  }

  // Method: Register with email & password
  Future<bool> regusterNewUser(
    String email,
    String password,
  ) async {
    _setLoading(true);
    try {
      await _fbAuth.createUser(
        email: email,
        password: password,
      );
      _setLoading(false);
      return true;
    } on FirebaseAuthException catch (e) {
      _handleError(e);
      return false;
    } catch (e) {
      _errorMessage = "An unknown error occurred.";
      _setLoading(false);
      return false;
    }
  }

  // Method: Login with email and password

  Future<bool> loginUser(
    String email,
    String password,
  ) async {
    _setLoading(true);
    try {
      await _fbAuth.loginUser(
        email: email,
        password: password,
      );
      _setLoading(false);
      return true;
    } on FirebaseAuthException catch (e) {
      _handleError(e);
      return false;
    } catch (e) {
      _errorMessage = "An unknown error occurred.";
      _setLoading(false);
      return false;
    }
  }

  // Method: Reset password
  Future<bool> resetPassword(String email) async {
    _setLoading(true);
    try {
      await _fbAuth.sendPasswordResetEmail(email: email);
      _errorMessage = '';
      _setLoading(false);
      return true;
    } on FirebaseAuthException catch (e) {
      _handleError(e);
      return false;
    }
  }

  // Method: Logout
  Future<void> logout() async {
    await _fbAuth.signOut();
    _currentUser = null;
    notifyListeners();
  }

  // Helper method: Set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _handleError(FirebaseAuthException e) {
    _errorMessage = _mapFirebaseError(e);
    _setLoading(false);
  }

  // Helper method: Handle FirebaseAuthException
  String _mapFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'This email address is already in use. Please try another one.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This user has been disabled. Please contact support.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled. Please contact support.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }

  Future<void> readFirestoreData() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('users').get();
      for (final doc in snapshot.docs) {
        print('Document ID: ${doc.id}, Data: ${doc.data()}');
      }
    } catch (e) {
      print('Error fetching Firestore data: $e');
    }
  }

//
}
