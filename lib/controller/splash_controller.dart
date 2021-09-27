import 'package:flutter_movies/screen/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    goToWelcomeScreen();
  }

  void goToWelcomeScreen() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.off(
        () => WelcomeScreen(),
      ),
    );
  }
}
