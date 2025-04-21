import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmoovItemContainer extends StatelessWidget {

  final Widget child;

  const EmoovItemContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context)
  {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        margin: const EdgeInsets.only(bottom: 9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5.0,
            )
          ],
        ),
        child: child
    );
  }
}