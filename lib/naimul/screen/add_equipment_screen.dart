import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_taker/naimul/screen/add_item_screen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AddEquipmentScreen extends StatefulWidget {
  const AddEquipmentScreen({super.key});

  @override
  State<AddEquipmentScreen> createState() => _AddEquipmentScreenState();
}

class _AddEquipmentScreenState extends State<AddEquipmentScreen> {
  List<Map<String, dynamic>> cookingItems = [
    {'name': 'Large pan', 'selected': true},
    {'name': 'Large pot', 'selected': false},
    {'name': 'Wok', 'selected': false},
    {'name': 'Roasting pan', 'selected': false},
    {'name': 'Frying pan', 'selected': true},
    {'name': 'Sauce pan', 'selected': false},
  ];

  List<Map<String, dynamic>> bankingItems = [
    {'name': 'Ledger', 'selected': true},
    {'name': 'Calculator', 'selected': false},
    {'name': 'Printer', 'selected': false},
    {'name': 'Cash Drawer', 'selected': false},
    {'name': 'POS Machine', 'selected': true},
    {'name': 'Checkbook', 'selected': false},
  ];

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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              'Kitchen Equipment',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp),
            ),
            SizedBox(height: 28.h),
            buildProgressSection(),
            SizedBox(height: 32.h),

            ///================================ Cooking Equipment Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cooking Equipment',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff272727),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_up),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            EquipmentGrid(
              items: cookingItems,
              onItemTap: (index) {
                setState(() {
                  cookingItems[index]['selected'] =
                  !cookingItems[index]['selected'];
                });
              },
              shrinkWrap: true,
            ),
            SizedBox(height: 32.h),

            /// ======================Banking Equipment Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Banking Equipment',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff272727),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_up),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            EquipmentGrid(
              items: bankingItems,
              onItemTap: (index) {
                setState(() {
                  bankingItems[index]['selected'] =
                  !bankingItems[index]['selected'];
                });
              },
              shrinkWrap: true,
            ),
            SizedBox(height: 40.h),

            ///==============================add button
            InkWell(
              onTap: (){


                Get.to(AddItemScreen());

              },
              child: Container(
                height: 45.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    'Add Equipment',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
  ///========================================================= Progress Section

  Container buildProgressSection() {
    return Container(
      height: 101.h,
      width: double.infinity,
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

///======================================================= Equipment Grid Widget
class EquipmentGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final void Function(int index)? onItemTap;
  final bool shrinkWrap;

  const EquipmentGrid({
    Key? key,
    required this.items,
    this.onItemTap,
    this.shrinkWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(), // scroll off
      shrinkWrap: shrinkWrap,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            if (onItemTap != null) onItemTap!(index);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: 109.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: item['selected'] ? Colors.black : Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.kitchen_outlined,
                      size: 48.sp,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                item['name'],
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
