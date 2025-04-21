import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @{category Widget}
/// 높이가 없는 평평한 버튼 위젯
class EmoovFlatButton extends StatelessWidget
{
  final VoidCallback onTap;
  final String content;
  final bool isLoading;
  final bool disabled;
  final Color bgColor;
  final Color borderColor;
  final Color fontColor;

  const EmoovFlatButton({
    super.key,
    required this.onTap,
    required this.content,
    required this.bgColor,
    required this.borderColor,
    required this.fontColor,
    this.isLoading = false,
    this.disabled = false,
  });

  void onPressed() {
    if (isLoading) {
      return;
    }
    onTap();
  }

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4.r),
        ),
        elevation: 0,
        backgroundColor: bgColor,
      ),
      onPressed: disabled ? null : onPressed,
      child: (isLoading)
          ? SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimary,
          )
      )
          : Text(content,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: fontColor,
        ),
      ),
    );
  }

}