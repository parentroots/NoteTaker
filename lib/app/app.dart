import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_taker/ui/screens/splash/screen/splash_screen.dart';
import '../core/appRoute/app_routes.dart';


class NoteTaker extends StatelessWidget {
  const NoteTaker({super.key});

  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
    designSize: const Size(375, 812),
   child: GetMaterialApp(
   debugShowCheckedModeBanner:false,
   defaultTransition: Transition.fadeIn,
   transitionDuration: const Duration(milliseconds: 200),
    initialRoute:AppRoute.splashScreen,
    navigatorKey: Get.key,
    getPages:AppRoute.routes,
    home:SplashScreen(),
    )

   );
  }
}
