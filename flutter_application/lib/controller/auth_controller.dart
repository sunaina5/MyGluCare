import 'package:flutter_application/model/user/user_model.dart';
import 'package:flutter_application/services/firebase_auth_services.dart';
import 'package:flutter_application/services/firestore_db.dart';

class AuthController {
  static Future<bool> signUp(UserModel user,String password)async{
    try{
     final result = await FirebaseAuthServices.firebaseSignUp(user.email??'', password);
     if(result !=null){
        user = user.copyWith(id: result.uid);
        // Create the user in Firestore
        final isUserCreated = await createUserInFirestore(user);
        if(isUserCreated){
          return true;
        }else{
          // If user creation in Firestore fails, delete the Firebase Auth user
          await FirebaseAuthServices.logoutUser();
          return false;
        }
     }
      return false;
    }
    catch(e){
      
      return false;
    }
  }

  // create a user in firestore
  static Future<bool> createUserInFirestore(UserModel user) async {
    try {
      // Assuming you have a Firestore service to handle user creation
      final userData = {
        'id': user.id,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'dob': user.dob?.toIso8601String(),
        'sex':user.sex};
      // Add the user to Firestore
      await firestoreDb.collection('users').doc(user.id).set(userData);
      // Optionally, you can also update the user's profile image if available
      if (user.profileImage != null) {
        await firestoreDb.collection('users').doc(user.id).update({
          'profileImage': user.profileImage,
        });
      }
      // Return true if the user was created successfully

      return true;
    } catch (e) {
     
      return false;
    }
  }
  
}