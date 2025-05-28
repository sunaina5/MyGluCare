import 'package:flutter/material.dart';
import 'package:flutter_application/screen/intro/Intro.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Center(
          child: Lottie.asset(
            'assets/animations/splash.json',
            repeat: false,
            onLoaded: (composition) {
              Future.delayed(
                Duration(seconds: 3),
                () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Introduction()));
                },
              );
            },
          ),
      )

    );
  }
}