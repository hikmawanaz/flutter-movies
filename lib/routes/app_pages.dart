import 'package:flutter_movies/bindings/login_bindings.dart';
import 'package:flutter_movies/bindings/movies_bindings.dart';
import 'package:flutter_movies/bindings/splash_bindings.dart';
import 'package:flutter_movies/bindings/welcome_bindings.dart';
import 'package:flutter_movies/screen/login_screen.dart';
import 'package:flutter_movies/screen/movies_screen.dart';
import 'package:flutter_movies/screen/splash_screen.dart';
import 'package:flutter_movies/screen/welcome_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASH_SCREEN, page: () => SplashScreen(), binding: SplashBinding()),
    GetPage(name: Routes.WELCOME_SCREEN, page: () => WelcomeScreen(), binding: WelcomeBinding()),
    GetPage(name: Routes.LOGIN_SCREEN, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(name: Routes.MOVIE_SCREEN, page: () => MoviesScreen(), binding: MoviesBinding()),
  ];
}

abstract class Routes {
  static const SPLASH_SCREEN = '/splash';
  static const WELCOME_SCREEN = '/welcome';
  static const LOGIN_SCREEN = '/login';
  static const MOVIE_SCREEN = '/movies';
}
