import 'package:flutter/material.dart';
import 'package:flutter_application/screen/authentication/login_screen.dart';
import 'package:flutter_application/screen/home.dart';
import 'package:flutter_application/screen/intro/Intro.dart';
import 'package:flutter_application/services/firebase_auth_services.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _startApp();
  }

  Future<void> _startApp() async {
    // Let splash animation show for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seenIntro = prefs.getBool('seen_intro') ?? false;

    if (seenIntro) {
      final user = await FirebaseAuthServices.getCurrentUser();
      if (user == null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      } else {
        // Navigate to home if user is logged in
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
      }
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Introduction()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
        Center(
          child: Lottie.asset(
            'assets/animations/splash.json',
            repeat: false,
           
          ),
      )

    );
  }
}