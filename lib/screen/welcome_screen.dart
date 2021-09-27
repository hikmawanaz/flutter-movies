import 'package:flutter/material.dart';
import 'package:flutter_movies/controller/welcome_controller.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
        init: WelcomeController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      "assets/ic_turbo.png",
                      width: 150,
                      fit: BoxFit.fitWidth,
                    ),
                    Text(
                      "WELCOME",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(36),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0, left: 32.0, right: 32.0),
                        child: Text("GETTING START"),
                      ),
                      onPressed: () {
                        controller.gettingStart();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
