import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleNoteViewScreen extends StatefulWidget {
  const SingleNoteViewScreen({super.key});

  @override
  State<SingleNoteViewScreen> createState() => _SingleNoteViewScreenState();
}

class _SingleNoteViewScreenState extends State<SingleNoteViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebe9fa),
      appBar: AppBar(
        title: Text('Meal bazar'),
        actions: [
          CircleAvatar(child: IconButton(onPressed: (){}, icon: Icon(Icons.edit))),
          SizedBox(width: 5.w,),
          CircleAvatar(child: IconButton(onPressed: (){}, icon: Icon(Icons.delete))),
          SizedBox(width: 5.w,),
          CircleAvatar(child: IconButton(onPressed: (){}, icon: Icon(Icons.restore_from_trash_outlined))),
          SizedBox(width: 5.w,),
        ],
      ),
    );
  }
}
