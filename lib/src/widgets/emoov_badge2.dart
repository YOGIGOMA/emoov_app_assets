import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmoovBadge2 extends StatelessWidget {

  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final double fontSize;
  final double width;
  final double height;

  const EmoovBadge2({
    super.key,
    required this.label,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.fontColor,
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(right: 2.5),
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 1.5),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: borderColor, width: 1),
      ),
      child: Center(
        child: Text(label,
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
            fontWeight: FontWeight.w600,
          ),
        )
      )
    );
  }
}