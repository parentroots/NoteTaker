import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_taker/componant/text/app_text.dart';
import 'package:note_taker/componant/text_field/text_field.dart';
import 'package:note_taker/core/appRoute/app_routes.dart';
import 'package:note_taker/ui/screens/home/controller/home_screen_controller.dart';
import 'package:note_taker/ui/screens/note_list/screen/note_list_screen.dart';
import 'package:note_taker/ui/screens/widget/home_app_bar/home_app_bar.dart';
import '../widget/note_category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String? selectedCategory;

List<String> categories = ["Personal", "Work", "Study", "Others"];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xff8671F6),
            onPressed: () {
              buildNoteDialog(controller);
            },
            child: Icon(Icons.add, color: Colors.white, size: 24),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,

          bottomNavigationBar: Container(
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.only(
                topRight: Radius.circular(20.r),
                topLeft: Radius.circular(20.r),
              ),
              color: Color(0xffFFFFFF),
            ),
          ),

          appBar: HomeAppBar(),
          backgroundColor: Color(0xffebe9fa),
          body: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildBannerSection(controller),

                  SizedBox(height: 30.h),

                  NoteCategory(
                    title1: 'Personal',
                    title2: 'Academic',
                    onTapItem1: () {
                     Get.toNamed(AppRoute.noteListScreen);
                    },
                    onTapItem2: () {
                      print('Academic clicked');
                    },
                    noteCount1: '10',
                    noteCount2: '50',
                  ),

                  SizedBox(height: 20),

                  NoteCategory(
                    title1: 'Work',
                    title2: 'Others',
                    onTapItem1: () {
                      print('Work clicked');
                    },
                    onTapItem2: () {
                      print('Others clicked');
                    },
                    noteCount1: '39',
                    noteCount2: '15',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> buildNoteDialog(HomeScreenController controller) {
    return Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: AppText(text: 'Add a note', fontSize: 18.sp),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            DropdownButtonFormField<String>(
              decoration: InputDecoration(

                fillColor: Colors.white,
                filled: true,
                labelText: "Select Category",
                border: OutlineInputBorder(),
              ),
              value: selectedCategory,
              items: categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category,style: TextStyle(
                    fontSize: 12.sp,
                  ),),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),


            SizedBox(height: 14.h,),

            SizedBox(
              height: 45.h,
              child: AppTextField(
                fontSize: 14.sp,
                hintSize: 14.sp,
                controller: controller.noteTitleTEController,
                hintText: 'Enter  Note title',
                hintTextColor: Colors.grey,
              ),
            ),

            SizedBox(height: 18.h),

            AppTextField(
              maxLine: 3,
              hintSize: 14.sp,
              controller: controller.noteContentTEController,
              hintText: 'Enter your Note ',
              hintTextColor: Colors.grey,
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 40,
              width: 120.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Color(0xFFFFFFFF),
              ),
              child: Center(
                child: AppText(
                  text: 'Cancel',
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),

          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 40.h,
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Color(0xFFFFFFFF),
              ),
              child: Center(
                child: AppText(
                  text: "Ok",
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildBannerSection(HomeScreenController controller) {
    return Container(
      height: 150.h,
      width: double.maxFinite,
      decoration: BoxDecoration(color: Color(0xffebe9fa)),

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 0,
            top: 0,
            child: Container(
              width: 280.w,
              height: 50.h,

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
                    padding: EdgeInsets.only(left: 20.w),
                    child: Container(
                      height: 71.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        gradient: LinearGradient(
                          colors: [Color(0xff9988F0), Color(0xff8671F6)],
                          begin: Alignment(-0.5, -1), // custom start
                          end: Alignment(0.5, 1),
                        ),
                      ),
                      child: Center(
                        child: AppText(
                          text: controller.currentTime,
                          fontSize: 24.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
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
