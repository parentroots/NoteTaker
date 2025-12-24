import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
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
        ),
        elevation: 0,
      ),

      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
          
              SizedBox(height: 24.h,),
          
              Text('Add Equipment',style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF272727)
              ),),
              
              SizedBox(height: 8.h,),
              Text('Add your equipment to ensure that the equipment can be \n used to make certain foods.',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff777777)
              ),),
          
              SizedBox(height: 20.h,),
          
              Text('Previews',style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF272727)
              ),),
          
              SizedBox(height: 8.h,),
              
              Container(
                height: 112.h,
                width: 107.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Color(0xFFF2F2F2)
                ),
                child: Center(
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                ),
              ),
          
              SizedBox(height: 16.h,),
              Text('Name',style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF272727)
              ),),
          
          
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 16.h),
                height: 60.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Color(0xFFF2F2F2)
                ),
                child: Text('Maple Wood Reversible Cutting Board',style: TextStyle(
          
                  fontSize: 12.sp,
                  color: Color(0xFF272727)
                ),),
              ),
          
              SizedBox(height: 16.h,),
          
              DropdownField(
                title: 'Brand',
                value: 'Musashi',
                onTap: () {
                  print('Dropdown tapped!');
                },
              ),
          
          
              SizedBox(height: 16.h,),
          
              DropdownField(
                title: 'Material',
                value: 'Wood',
                onTap: () {
                  print('Dropdown tapped!');
                },
              ),
          
              SizedBox(height: 16.h,),
          
              DropdownField(
                title: 'Weight',
                value: '48g',
                onTap: () {
                  print('Dropdown tapped!');
                },
              ),
          
          
              SizedBox(height: 16,),
          
              Container(
                height: 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Color(0xFF272727)
                ),
                child: Center(
                  child: Text('Add item',style: TextStyle(

                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),),
                ),
              ),
          
              SizedBox(height: 20.h,)
          
          
          
          
          
            ],
          ),
        ),
      ),
    );
  }
}



class DropdownField extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback? onTap;
  final IconData icon;

  const DropdownField({
    Key? key,
    required this.title,
    required this.value,
    this.onTap,
    this.icon = Icons.keyboard_arrow_down,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF272727),
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Color(0xFFF2F2F2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                  width: 16.w,
                  child: Icon(icon),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
