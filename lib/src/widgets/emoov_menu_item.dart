
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmoovMenuItem extends StatelessWidget {
  final VoidCallback onTap;
  final String content;
  final IconData iconData;

  const EmoovMenuItem({
    super.key,
    required this.content,
    required this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context)
  {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0.01.sw, vertical: 0.01.sh),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(iconData,
                size: 0.08.sw,
              ),
              SizedBox(width: 0.02.sw,),
              Text(content,
                  style: TextStyle(fontSize: 16.sp)
              )
            ],
          )
      ),
    );
  }
}