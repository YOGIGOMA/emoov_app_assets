
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmoovTag extends StatelessWidget {

  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final Color fontColor;
  final double fontSize;

  const EmoovTag({
    super.key,
    required this.label,
    required this.fontSize,
    required this.backgroundColor,
    required this.borderColor,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: 22,
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.only(
          left: 7, right: 7,
          top: 3, bottom: 3
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(2.r),
        border: Border.all(color: borderColor),
      ),
      child: Center(
        child: Text(label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}