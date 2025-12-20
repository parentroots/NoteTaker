import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({super.key, this.size = 60, this.strokeWidth = 4});

  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size.sp,
        width: size.sp,
        child: CircularProgressIndicator.adaptive(strokeWidth: strokeWidth),
      ),
    );
  }
}