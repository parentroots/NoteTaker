import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_taker/componant/text/app_text.dart';
import 'package:note_taker/ui/screens/home/controller/home_screen_controller.dart';
import 'package:note_taker/ui/screens/widget/home_app_bar/home_app_bar.dart';
import 'package:note_taker/utils/constants/app_colors.dart';
import 'package:note_taker/utils/constants/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return Scaffold(
          appBar: HomeAppBar(),
          backgroundColor: Color(0xffebe9fa),
          body: Column(
            children: [
              buildBannerSection(controller),

              SizedBox(height: 30.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(15.h),
                    height: 150.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppImages.files),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          SizedBox(
                            height:24.h,
                              width: 24.w,
                              child:Icon(Icons.person)),
                          AppText(text: 'Personal')
                        
                        ],
                      ),
                    ),
                  )
                  ,


                  Container(
                    height: 150.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(image:AssetImage(AppImages.files))
                    ),
                  ),
                ],
              )



            ],
          ),
        );
      },
    );
  }

  Container buildBannerSection(HomeScreenController controller) {
    return Container(
              height: 150.h,
              width: double.maxFinite,
              decoration: BoxDecoration(  color: Color(0xffebe9fa),),

              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    bottom: 0,
                    top: 0,
                    child: Container(
                      width: 280.w,
                      height: 50,

                      decoration: BoxDecoration(
                        color: Color(0xFFE0DAFF),
                        borderRadius: BorderRadius.circular(22.r),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    top: 0,
                    child: Container(
                      width: 320.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFB2A5FF),
                        borderRadius: BorderRadius.circular(22.r),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    top: 0,
                    child: Container(
                      width: 350.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.r),
                        gradient: LinearGradient(
                          colors: [Color(0xFF6D4EFF), Color(0xFF836AFA)],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w,),
                            child: Container(
                              height: 71.h,
                              width: 150.w,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(20.r),
                                gradient: LinearGradient(colors:
                                [

                                  Color(0xff9988F0),
                                  Color(0xff8671F6),
                                ], begin: Alignment(-0.5, -1), // custom start
                                end: Alignment(0.5, 1),

                              )

                              ),
                              child: Center(
                                child: AppText(text: controller.currentTime,fontSize: 24.sp,color: Colors.white,fontWeight: FontWeight.w700,),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),


                  ),
                ],
              ),
            );
  }
}
