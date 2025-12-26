import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:note_taker/componant/text/app_text.dart';

import '../../../../utils/constants/app_colors.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});



  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {

  List<Map<String,dynamic>> noteList=[

    {
      'title':"Meal Bazar",
      'content':'2 kg rice, 1 kg Chicken, green chili 0.5 kg'
    },


    {
      'title':"Meal Bazar",
      'content':'2 kg rice, 1 kg Chicken, green chili 0.5 kg, kg rice, 1 kg Chicken, green chili 0.5 kg, kg rice, 1 kg Chicken, green chili 0.5 kg'
    },

    {
      'title':"Meal Bazar",
      'content':'2 kg rice, 1 kg Chicken, green chili 0.5 kg'
    },


    {
      'title':"Meal Bazar",
      'content':'2 kg rice, 1 kg Chicken, green chili 0.5 kg, kg rice, 1 kg Chicken, green chili 0.5 kg, kg rice, 1 kg Chicken, green chili 0.5 kg'
    },
    {
      'title':"Meal Bazar",
      'content':'2 kg rice, 1 kg Chicken, green chili 0.5 kg, kg rice, 1 kg Chicken, green chili 0.5 kg, kg rice, 1 kg Chicken, green chili 0.5 kg'
    },

  ];



  @override
  Widget build(BuildContext context) {


    final String? category = Get.parameters['category'];


    return Scaffold(
      backgroundColor: Color(0xffebe9fa),
      appBar: AppBar(
        title: Text("$category Notes",),),
      body: Column(
        children: [
      Expanded(
      child: MasonryGridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),

      itemCount: noteList.length,
      itemBuilder: (context, index) {
        final data=noteList[index];
        return Card(
          elevation: 1,
          margin: EdgeInsets.all(8),
          child: InkWell(
            onTap: (){
              Get.toNamed('/SingleNoteViewScreen');
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 18.sp,
                    text:data["title"],
                    fontWeight: FontWeight.w600,
                  ),


              SizedBox(height: 12.h),

                  AppText(
                    textAlign: TextAlign.start,
                    fontSize: 14.sp,
                    maxLines: 5,
                    fontWeight: FontWeight.w400,
                    text:data['content'],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
    )

    ],
      ),
    );
  }
}
