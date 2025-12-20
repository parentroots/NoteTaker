import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:note_taker/componant/button/app_button.dart';
import 'package:note_taker/componant/text/app_text.dart';
import 'package:note_taker/componant/text_field.dart';
import 'package:note_taker/ui/screens/onBoarding/controller/on_boarding_screen_controller.dart';
import 'package:note_taker/utils/constants/app_colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingScreenController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 100.h),

                  Align(alignment: Alignment.center, child: buildRichText()),
                  SizedBox(height: 60.h),

                  SizedBox(height: 40.h),

                  Lottie.asset(
                    'assets/lotties/notewriting.json',
                    width: 150.w,
                    height: 200.h,
                  ),
                ],
              ),

              /// BOTTOM SHEET
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 400.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                    color: AppColors.primaryColor,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),

                      /// top drag bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 3.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h),

                      Text(
                        'Well Come Buddy 💖 !',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                        ),
                      ),

                      /// Name Field
                      SizedBox(height: 40.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enter Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(height: 10.h),

                            SizedBox(
                              width: 0.9.sw,
                              child: AppTextField(
                                controller: controller.nameTEController,
                                hintText: 'Enter your name',
                              ),
                            ),

                            SizedBox(height: 40.h),

                            SizedBox(
                              height: 55.h,
                              width: double.maxFinite,
                              child: ElevatedButton(onPressed: (){}, child: Text('Enter',style: TextStyle(fontSize: 24.sp,color: Colors.black),),style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.whiteColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(12.r)
                                )

                              ),),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  RichText buildRichText() {
    return RichText(
      text: TextSpan(
        text: 'Note-Ta',
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: 'ker-App',
            style: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
