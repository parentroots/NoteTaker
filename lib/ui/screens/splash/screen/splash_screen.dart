import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_taker/core/appRoute/app_routes.dart';
import 'package:note_taker/utils/constants/app_colors.dart';
import 'package:note_taker/utils/constants/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;

  String fullText = "Note-Taker-App";
  String visibleText = "";
  int index = 0;

  @override
  void initState() {
    super.initState();

    /// LOGO ANIMATION
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _logoScale = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
    );

    _logoOpacity = Tween<double>(begin: 0, end: 1).animate(_logoController);

    _logoController.forward();


    Future.delayed(const Duration(milliseconds: 800), () {
      _startTyping();
    });

    goToNextScreen();
  }


  void goToNextScreen(){
    Future.delayed(const Duration(seconds: 5), () {

      Get.toNamed(AppRoute.onBoardingScreen);
    });
  }

  void _startTyping() {
    Future.delayed(const Duration(milliseconds: 120), () {
      if (index < fullText.length) {
        setState(() {
          visibleText += fullText[index];
          index++;
        });
        _startTyping();
      }
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                FadeTransition(
                  opacity: _logoOpacity,
                  child: ScaleTransition(
                    scale: _logoScale,
                    child: SizedBox(
                      height: 150.h,
                      width: 150.w,
                      child: Image.asset(AppImages.appLogo),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: visibleText.startsWith('Note-Ta')
                            ? 'Note-Ta'
                            : visibleText,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: visibleText.length > 7
                            ? visibleText.substring(7)
                            : '',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

          Positioned(
            bottom: 40.h,
            left: 0,
            right: 0,
            child: Text(
              "version: Octopus",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.primaryColor, fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }
}
