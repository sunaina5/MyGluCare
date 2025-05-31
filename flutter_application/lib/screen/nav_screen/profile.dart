import 'package:flutter/material.dart';
import 'package:flutter_application/screen/authentication/login_screen.dart';
import 'package:flutter_application/services/firebase_auth_services.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,    
       actions: [
        IconButton(onPressed: ()async{
          await FirebaseAuthServices.logoutUser();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }, icon: Icon(Icons.logout))
       ],
      ),
       body: Center(child: Text('Profile Screen')));
  }
}