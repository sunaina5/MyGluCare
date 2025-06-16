
import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/model/user/user_model.dart';
import 'package:flutter_application/services/firebase_auth_services.dart';
import 'package:flutter_application/services/firestore_db.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController {
  static Future<UserModel?> getCurrentUser ()async{
      try {
      final user = await FirebaseAuthServices.getCurrentUser();
      if (user == null || user.uid.isEmpty) return null;

      final docRef = firestoreDb.collection('users').doc(user.uid);
      final snapshot = await docRef.get();

      if (snapshot.exists && snapshot.data() != null) {
        final data = snapshot.data()!;
        return UserModel.fromJson(data).copyWith(id: user.uid);
      }

      return null;
      
    } catch (e) {
      throw Exception('Failed to get current user: $e');
    }

  }
  static Future<void> updateUser(UserModel user, Uint8List? avatarImage) async {
    try {
      final docRef = firestoreDb.collection('users').doc(user.id);
      if (user.id == null || user.id!.isEmpty) {
        throw Exception('User ID is required for update');
      }
      if (avatarImage != null) {
        final avatarPath = await uploadAvatarImage(avatarImage, user.id!);
        if (avatarPath != null) {
          user = user.copyWith(profileImage: avatarPath);
        } else {
          throw Exception('Failed to upload avatar image');
        }
      }
      await FirebaseAuthServices.updateUserProfile(
        displayName: '${user.firstName} ${user.lastName}',
        photoURL: user.profileImage,
      );
      await docRef.set(user.toJson(), SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

static Future<String?> uploadAvatarImage(Uint8List imageBytes, String userId) async {
  final supabase = Supabase.instance.client;
  final filePath = 'profile/avatar/$userId.png';

  try {
    // Upload
    supabase.storage.from('profile-pic').uploadBinary(
      filePath,
      imageBytes,
      fileOptions: const FileOptions(
        upsert: true, // allows replacement
        contentType: 'image/png',
      ),
    );

    

    return filePath;
  } catch (e) {
    log('Upload error: $e');
    return null;
  }
}
}