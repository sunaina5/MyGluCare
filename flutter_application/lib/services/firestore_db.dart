import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseFirestore firestoreDb =
    FirebaseFirestore.instanceFor(app: Firebase.app());
