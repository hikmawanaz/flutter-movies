import 'package:flutter/material.dart';
import 'package:flutter_movies/bindings/splash_bindings.dart';
import 'package:flutter_movies/routes/app_pages.dart';
import 'package:flutter_movies/screen/movies_screen.dart';
import 'package:flutter_movies/screen/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialBinding: SplashBinding(),
      home: SplashScreen(),
    );
  }
}
