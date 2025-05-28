import 'package:flutter/material.dart';
import 'package:flutter_application/splash/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash( 
        // splash: Splash(),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
  }
}
