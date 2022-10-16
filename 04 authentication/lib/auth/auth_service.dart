import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Service for authentication, calls Firebase methods, updates
/// the Riverpod state for loading
class AuthService {
  final StateController<bool> progressController;

  AuthService(this.progressController);

  /// Sign in anonymously in Firebase
  void signIn() async {
    progressController.state = true;
    try {
      await _simulateLongOperation();
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseException catch (e) {
      print("Sign-in error: ${e.message}");
    }
    progressController.state = false;
  }

  /// Sign out from Firebase
  void signOut() async {
    progressController.state = true;
    try {
      await _simulateLongOperation();
      await FirebaseAuth.instance.signOut();
    } on FirebaseException catch (e) {
      print("Sign-out error: ${e.message}");
    }
    progressController.state = false;
  }

  /// Simulate a long operation. to simulate the delay, await for this
  /// function to complete
  Future<void> _simulateLongOperation() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
