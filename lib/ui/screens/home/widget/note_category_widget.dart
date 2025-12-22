
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../componant/text/app_text.dart';
import '../../../../utils/constants/app_images.dart';

class NoteCategory extends StatelessWidget {
  final String noteCount1;
  final String noteCount2;
  final String title1;
  final String title2;
  final VoidCallback onTapItem1;
  final VoidCallback onTapItem2;

  const NoteCategory({
    super.key,
    required this.title1,
    required this.title2,
    required this.onTapItem1,
    required this.onTapItem2, required this.noteCount1, required this.noteCount2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: onTapItem1,
          child: Container(
            padding: EdgeInsets.all(15.h),
            height: 160.h,
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
                    height: 60.h,
                    width: 60.w,
                    child: CircleAvatar(
                      child: SizedBox(
                        height: 30.h,
                        width: 30.w,

                        child: Image.asset(AppImages.workNote),
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  AppText(text: title1),

                  SizedBox(height: 8.h,),

                  AppText(text: "$noteCount1 notes",fontSize: 14.sp,)
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: onTapItem2,
          child: Container(
            padding: EdgeInsets.all(15.h),
            height: 160.h,
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
                    height: 60.h,
                    width: 60.w,
                    child: CircleAvatar(
                      child: SizedBox(
                        height: 30.h,
                        width: 30.w,

                        child: Image.asset(AppImages.workNote),
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),
                  AppText(text: title2),
                  SizedBox(height: 8.h,),
                  AppText(text: '$noteCount2 notes',fontSize: 14.sp,)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
