import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/key/global_key.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application/credentials/supabase.dart';
import 'package:flutter_application/services/firestore_db.dart';
import 'package:flutter_application/services/notification_services.dart';
import 'package:flutter_application/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sup;
import 'firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //------------------------------Firebase Crashlytics--------------------------------------------------------------

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  //------------------------------Firebase Crashlytics--------------------------------------------------------------
  // Initialize Firestore cache and persistence settings
  firestoreDb.settings = const Settings(
    persistenceEnabled: true, // Enable offline persistence
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED, // Optional: No size limit
  );

//---------------------------------supbase initialization------------------------------------------------
  // Initialize Supabase or any other services here if needed
  await sup.Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
 
await NotificationServices.init();
  tz.initializeTimeZones();
// log token for current user
  final user = FirebaseAuth.instance.currentUser;
  final token = await user?.getIdToken();
  log('Current user token: $token');


  runApp( const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      home: Splash( 
        // splash: Splash(),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
  }
}
