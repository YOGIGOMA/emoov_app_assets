import 'package:flutter/material.dart';

/// {@category Widget}
/// 비동기 연결오류가 발생할때 사용할 수 있는 위젯
class ConnectionError extends StatelessWidget
{
  const ConnectionError({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 50.sp,
                color: Colors.redAccent,
              ),
              const SizedBox(height: 10,),
              Text('죄송합니다.',
                  style: TextStyle(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )
              ),
              const SizedBox(height: 10,),
              Text('서버와 일시적으로\n접속 할 수 없습니다.',
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30,),
              Text('동일한 문제가 발생하는 경우는\n'
                  '앱을 완전히 종료후 다시 시작해 보시기 바랍니다.',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ]
        )
    );
  }
}