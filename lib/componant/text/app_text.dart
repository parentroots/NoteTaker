import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../utils/constants/app_colors.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.blackColor,
    required this.text,
    this.style,
    this.overflow = TextOverflow.ellipsis,
  });

  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left.w,
        right: right.w,
        top: top.h,
        bottom: bottom.h,
      ),
      child: Text(
        textAlign: textAlign,
        text,
        maxLines: maxLines,
        overflow: overflow,

      ),
    );
  }
}