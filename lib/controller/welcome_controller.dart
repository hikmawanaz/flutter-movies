import 'package:flutter_movies/screen/login_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class WelcomeController extends GetxController {
  void gettingStart() {
    Get.to(
      () => LoginScreen(),
    );
  }
}
