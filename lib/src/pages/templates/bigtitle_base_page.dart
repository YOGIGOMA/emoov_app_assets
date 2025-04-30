
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// @{category Page}
/// 큰 타이틀과 백그라운드 이미지를 제공하는 페이지 템플릿
///
class BigTitleBasePage extends ConsumerWidget
{
  final ScrollController scrollController;
  final String backPath;
  final String titleLine1;
  final String titleLine2;
  final String? titleLine3;
  final String? subTitle;
  final Widget body;

  const BigTitleBasePage({
    required this.scrollController,
    required this.backPath,
    required this.titleLine1,
    required this.titleLine2,
    required this.body,
    this.titleLine3,
    this.subTitle,
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    var fs = FocusScope.of(context);
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              onPressed: () {
                GoRouter.of(context).go(backPath);
              }
          ),
        ),
        body: GestureDetector(
            onTap:() {
              fs.unfocus();
            },
            child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0, left: 0,
                      child: SvgPicture.asset(
                        'assets/img/bg_deco_01.svg',
                        package: 'emoov_app_assets',
                        width: 374,
                        height: 261,
                      ),
                    ),
                    Positioned(
                      bottom: 0, right: 0,
                      child: SvgPicture.asset(
                        'assets/img/bg_deco_02.svg',
                        package: 'emoov_app_assets',
                        width: 375,
                        height: 210,
                      ),
                    ),
                    Positioned(
                      bottom: 0, right: 0,
                      child: SvgPicture.asset(
                        'assets/img/bg_deco_03.svg',
                        package: 'emoov_app_assets',
                        width: 305,
                        height: 120,
                      ),
                    ),
                    Positioned(
                      top:0, left:0, right: 0,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height - 180,
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: SingleChildScrollView(
                          //reverse: false,
                          padding: EdgeInsets.only(bottom: keyboardHeight + 50),
                          controller: scrollController,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 40,),
                              Text(titleLine1,
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text(titleLine2,
                                    style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff21ABD2),
                                    ),
                                  ),
                                ],
                              ),
                              if(titleLine3 != null) ... {
                                const SizedBox(height: 5,),
                                Text(titleLine3!,
                                  style: const TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                  )
                                ),
                              },
                              if(subTitle != null) ... {
                                const SizedBox(height: 20,),
                                Text(subTitle!,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                              },
                              const SizedBox(height: 30,),
                              body,
                            ]
                          )
                        )
                      )
                    )
                  ],
                )
            )
        )
    );
  }

}
