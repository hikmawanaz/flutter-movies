import 'package:flutter_movies/screen/movies_screen.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  void login() {
    Get.offAll(
      () => MoviesScreen(),
    );
  }
}