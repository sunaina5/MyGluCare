import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
 static final FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<User?> loginWithEmailAndPassword(String email, String password) async {
  try {
    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user;
  } catch (e) {
    throw Exception('Failed to login: $e');
  }
}
static Future<User?> firebaseSignUp(String email, String password) async {
  try {
    final UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user;
  } catch (e) {
    log('error: $e');
    if (e is FirebaseAuthException) {
      if (e.code == 'email-already-in-use') {
        throw "User with this email already exists";
      }
      log('error: $e');
      throw Exception('Error creating user: $e');
    }
    throw Exception('Error creating user: $e');
  }
}

static Future<void> logoutUser() async {
  await _auth.signOut();
}

static Future<Map<String, dynamic>> sendPasswordResetEmail(String email) async {
  try {
    await _auth.sendPasswordResetEmail(email: email);
    return {
      'status': 'success',
      'message': 'Password reset email sent successfully to $email',
    };
  } on FirebaseAuthException catch (e) {
    String errorMessage;
    switch (e.code) {
      case 'user-not-found':
        errorMessage = 'No user found with this email.';
        break;
      case 'invalid-email':
        errorMessage = 'The email address is not valid.';
        break;
      default:
        errorMessage = 'An error occurred: ${e.message}';
    }
    return {'status': 'error', 'message': errorMessage};
  } catch (e) {
    return {
      'status': 'error',
      'message': 'An unexpected error occurred: $e',
    };
  }
}

static Future<User?> getCurrentUser() async {
  try {
    final User? user = _auth.currentUser;
    if (user != null) {
      return user;
    } else {
      return null; // No user is currently signed in
    }
  } catch (e) {
    throw Exception('Error getting current user: $e');
  }     
}

static Future<void> updateUserProfile({
  String? displayName,
  String? photoURL,
}) async {
  try {
    final User? user = _auth.currentUser;
    if (user != null) {
      await user.updateProfile(displayName: displayName, photoURL: photoURL);
      await user.reload();
    } else {
      throw Exception('No user is currently signed in.');
    }
  } catch (e) {
    throw Exception('Error updating user profile: $e');
  }
}

// cahnge password
static Future<void> changePassword(String newPassword) async {
  try {
    final User? user = _auth.currentUser;
    if (user != null) {
      await user.updatePassword(newPassword);
      await user.reload();
    } else {
      throw Exception('No user is currently signed in.');
    }
  } catch (e) {
    throw Exception('Error changing password: $e');
  }
}

}