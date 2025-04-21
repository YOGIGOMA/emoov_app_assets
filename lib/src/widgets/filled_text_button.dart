import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilledTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String content;
  final bool disabled;
  final bool isLoading;
  final Color? bgColor;
  final Color? fontColor;

  const FilledTextButton(
      {super.key,
        required this.content,
        required this.onTap,
        this.disabled = false,
        this.isLoading = false,
        this.bgColor,
        this.fontColor,
      });

  void onPressed() {
    if (isLoading) {
      return;
    }

    onTap();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium!;
    final progressIndicatorSize = textStyle.fontSize! * 1.4;

    Color? buttonBgColor = Theme.of(context).colorScheme.primary;
    Color? fColor = Colors.white;
    if(fontColor != null) {
      fColor = fontColor;
    }
    if(bgColor != null) {
      buttonBgColor = bgColor;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        elevation: 0,
        backgroundColor: buttonBgColor,
        disabledBackgroundColor: Colors.grey.withOpacity(0.25),
        //padding: const EdgeInsets.all(15)
      ),
      onPressed: disabled ? null : onPressed,
      child: isLoading
          ? SizedBox(
          height: progressIndicatorSize,
          width: progressIndicatorSize,
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimary,
          )
      )
          : Text(content,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: fColor
        ),
      ),
    );
  }
}
