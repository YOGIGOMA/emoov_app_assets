import 'package:flutter/material.dart';

/// {@category Widget}
/// 비동기 연결오류가 발생할때 사용할 수 있는 위젯
class ConnectionError extends StatelessWidget
{
  const ConnectionError({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.warning,
              color: Colors.deepOrange,
              weight: 40,
              size: 30,
            ),
            const SizedBox(height: 10,),
            Text('서비스 연결중 오류가 발생했습니다.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xff3D3D3D),
              ),
            ),
          ],
        )
    );
  }
}