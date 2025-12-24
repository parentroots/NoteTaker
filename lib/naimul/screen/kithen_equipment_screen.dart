import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_taker/naimul/screen/add_equipment_screen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class KitchenEquipmentScreen extends StatefulWidget {
  const KitchenEquipmentScreen({super.key});

  @override
  State<KitchenEquipmentScreen> createState() => _KitchenEquipmentScreenState();
}

class _KitchenEquipmentScreenState extends State<KitchenEquipmentScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          )
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),

            Text(
              'Kitchen Equipment',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp),
            ),

            SizedBox(height: 28),

            buildProgressSection(),

            SizedBox(height: 28),
            
            Text('My Equipment',style: TextStyle(
              fontSize: 16,
              color: Color(0xFF272727),
              fontWeight: FontWeight.w600
            ),),

            SizedBox(height: 20,),



            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12.h),
                    height: 144.h,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color(0xFFF2F2F2)

                    ),

                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text('Extra Long Professional \nSilicone Oven Mitt Set',style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF272727),
                            ),),

                            SizedBox(height: 4.h,),

                            Row(
                              children: [


                                Text('128 g',style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Color(0xFF777777)
                                ),),

                                SizedBox(width: 5.w,),

                                Text('Stainless Steel',style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Color(0xFF777777)
                                ),),

                              ],
                            ),


                            SizedBox(height: 24.h,),

                            Container(
                              height: 25.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xFFDBEBD9),

                              ),
                              child: Center(
                                child: Text('Your Kitchen is Ready',style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF2F8328)
                                ),),
                              ),
                            )

                          ],
                        ),


                        Container(
                          height: 89.h,
                          width: 92.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Colors.purple
                          ),
                        )

                      ],
                    ),
                  );
                }, separatorBuilder: (context, index) {
                return SizedBox(height: 12.h,);
              },),
            ),

            InkWell(
              onTap: (){
                Get.to(AddEquipmentScreen());
              },
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Color(0xff272727),
                ),
                child: Center(
                  child: Text('Add Equipment',style: TextStyle(
                      color: Colors.white
                  ),),
                ),
              ),
            ),

            SizedBox(height: 30.h,),









          ],
        ),
      ),
    );
  }

  Container buildProgressSection() {
    return Container(
      height: 101.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Color(0xFFF2F2F2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You’re Ready for Cooking',
              style: TextStyle(fontSize: 12.sp, color: Color(0xFF272727)),
            ),

            SizedBox(height: 16.h),

            LinearPercentIndicator(
              barRadius: Radius.circular(30),
              lineHeight: 10.0,
              percent: 0.7,
              progressColor: Color(0xffFD713F),
            ),

            SizedBox(height: 16.h),

            RichText(
              text: TextSpan(
                text: "Your kitchen can handle ",
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
                children: <TextSpan>[
                  TextSpan(
                    text: "70%",
                    style: TextStyle(
                      color: Color(0xffFD713F),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " of recipes on the platform",
                    style: TextStyle(color: Colors.black, fontSize: 12.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
