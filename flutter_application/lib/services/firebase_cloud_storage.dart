import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage firebaseStorage = FirebaseStorage.instanceFor(
    app: Firebase.app(),
    bucket: 'gs://manage-the-day-cb22d.firebasestorage.app');