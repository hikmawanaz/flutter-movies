import 'package:flutter/material.dart';
import 'package:flutter_movies/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Center(
                child: Image.asset("assets/ic_turbo.png",width: 150,fit: BoxFit.fitWidth,),
              ),
            ),
          );
        });
  }
}
