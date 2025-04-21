
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @{category Widget}
class EmoovBadge extends StatelessWidget {

  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final double fontSize;

  const EmoovBadge({
    super.key,
    required this.label,
    required this.fontSize,
    required this.backgroundColor,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context)
  {
    return Container(
        margin: EdgeInsets.only(right: 0.025.sw),
        padding: EdgeInsets.only(
            left: 0.02.sw, right: 0.02.sw,
            top: 0.005.sh, bottom: 0.005.sh
        ),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10.r)
        ),
        child: Text(label,
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
          ),
        )
    );
  }
}