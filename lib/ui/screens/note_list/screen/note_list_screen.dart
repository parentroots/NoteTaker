import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade50,
      ),
      body: Column(
        children: [
      Expanded(
      child: MasonryGridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      itemCount: noteList.length,
      itemBuilder: (context, index) {
        final data=noteList[index];
        return Container(
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
                fontSize: 1,
                text:data["title"],
              ),
              const SizedBox(height: 6),
              AppText(
                fontSize: 14.sp,
                maxLines: 5,
                text:data['content'],
              ),
            ],
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
