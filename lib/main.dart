import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsc_tasc/Screens/splash.dart';

void main() {
  // await Future.delayed(const Duration(seconds: 2))
  //     .then((value) => FlutterNativeSplash.remove());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
