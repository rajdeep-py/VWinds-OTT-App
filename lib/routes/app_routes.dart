import 'package:get/get.dart';
import 'package:audio_ott_app/bindings/auth_binding.dart';
import 'package:audio_ott_app/screens/auth/splash_screen.dart';
import 'package:audio_ott_app/screens/auth/login_screen.dart';
import 'package:audio_ott_app/screens/auth/signup_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';

  static final List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: AuthBinding(),
    ),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: signup, page: () => const SignupScreen()),
  ];
}
