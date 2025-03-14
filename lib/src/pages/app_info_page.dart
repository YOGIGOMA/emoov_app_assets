import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// <summary>
/// 앱 정보를 전시하는 페이지
/// </summary>
class AppInfoPage extends ConsumerWidget {
  final String appVersion;
  final List<String> openSourceLicences;

  const AppInfoPage({
    required this.appVersion,
    required this.openSourceLicences,
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF7F7F7),
        foregroundColor: Colors.black,
        title: const Text('앱정보',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            )
        ),
        elevation: 0,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('앱버전: $appVersion',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  )
              ),
              const SizedBox(height: 20,),
              Text('오픈소스 라이센스 정보',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  )
              ),
              const SizedBox(height: 10,),
              Expanded(
                  child: ListView.builder(
                      itemCount: openSourceLicences.length,
                      itemBuilder: (context, index) {
                        return Text(openSourceLicences[index],
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12.sp,
                            )
                        );
                      }
                  )
              ),
            ],
          )
      ),
    );
    // return
  }
}