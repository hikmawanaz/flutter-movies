import 'package:flutter/material.dart';
import 'package:flutter_movies/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 40),
                    Image.asset(
                      "assets/ic_turbo.png",
                      width: 150,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(height: 36),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "User name",
                        hintStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(36.0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(36.0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 42.0,
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
                            top: 16.0, bottom: 16.0, left: 40.0, right: 40.0),
                        child: Text("LOGIN"),
                      ),
                      onPressed: () {
                        controller.login();
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
