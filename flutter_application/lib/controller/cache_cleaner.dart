


import 'package:flutter/material.dart';
import 'package:flutter_application/key/global_key.dart';
import 'package:flutter_application/screen/authentication/login_screen.dart';
import 'package:flutter_application/services/firebase_auth_services.dart';
import 'package:flutter_application/services/firestore_db.dart';


Future<void> clearFirestoreCacheOnLogout() async {



  try {
    // Step 1: Terminate the current Firestore instance
    await firestoreDb.terminate();

    // Step 2: Clear the local cache
    await firestoreDb.clearPersistence();

    // Step 3: Re-initialize Firestore (if needed)
    await firestoreDb.enableNetwork(); // Optional

    // Perform logout operation
    await FirebaseAuthServices.logoutUser();
    navigatorKey.currentState?.pop();
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
   
  } catch (e, stackTrace) {
    debugPrint('Error during cache clearing and logout: $e');
    debugPrintStack(stackTrace: stackTrace);
    throw Exception('Failed to clear Firestore cache and logout: $e');
  } finally { 

    // Optionally, show a snackbar or dialog to inform the user
  }

}
