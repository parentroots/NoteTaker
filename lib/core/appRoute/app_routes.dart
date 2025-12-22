import 'package:get/get.dart';
import 'package:note_taker/ui/screens/home/screen/home_screen.dart';
import 'package:note_taker/ui/screens/onBoarding/screen/on_boarding_screen.dart';

import '../../ui/screens/splash/screen/splash_screen.dart';




class AppRoute {
  ///==================== Initial Routes ====================
  static const String splashScreen = "/splash_screen";
  static const String onBoardingScreen = "/on_boarding_screen";
  static const String homeScreen = "/home_screen";

  static List<GetPage> routes = [
    ///==================== Authentication  Routes ====================

    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onBoardingScreen, page: () => const OnBoardingScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),




  ];
}