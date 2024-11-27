import 'package:ddd_firebase/domain/services/utils_service.dart';
import 'package:ddd_firebase/presentation/core/const/all_library.dart';
import 'package:firebase_auth/firebase_auth.dart';

final class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService({FirebaseAuth? firebaseAuth}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  /// Login
  Future<User?> login({required BuildContext context, required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      _handleAuthError(context, e, 'Login');
    } catch (e) {
      Utils.fireSnackBar('Unexpected error: $e', context);
    }
    return null;
  }

  /// Register
  Future<User?> register({required BuildContext context, required String fullName, required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(fullName);
        await user.reload();
        return _firebaseAuth.currentUser;
      }
    } on FirebaseAuthException catch (e) {
      _handleAuthError(context, e, 'Registration');
    } catch (e) {
      Utils.fireSnackBar('Unexpected error: $e', context);
    }
    return null;
  }

  /// Logout
  Future<void> logout(BuildContext context) async {
    try {
      await _firebaseAuth.signOut();
      Utils.fireSnackBar('See you soon', context);
    } catch (e) {
      Utils.fireSnackBar('Failed to log out: $e', context);
    }
  }

  /// Delete account
  Future<void> deleteAccount(BuildContext context) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.delete();
        Utils.fireSnackBar('Goodbye', context);
      }
    } on FirebaseAuthException catch (e) {
      _handleAuthError(context, e, 'Account Deletion');
    }
  }

  /// Private error handling helper
  void _handleAuthError(BuildContext context, FirebaseAuthException e, String action) {
    String message;
    switch (e.code) {
      case 'invalid-email':
        message = 'The email address is not valid.';
        break;
      case 'user-not-found':
        message = 'No user found for this email.';
        break;
      case 'wrong-password':
        message = 'Incorrect password.';
        break;
      case 'email-already-in-use':
        message = 'The email is already in use.';
        break;
      default:
        message = 'Error occurred during $action: ${e.message}';
    }
    Utils.fireSnackBar(message, context);
  }
}
