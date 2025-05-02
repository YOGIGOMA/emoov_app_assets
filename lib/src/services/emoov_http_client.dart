import 'package:dio/dio.dart';

import '../../emoov_app_assets.dart';
import '../riverpod/app_user_notifier.dart';
import 'auth_request_interceptor.dart';

/// @{category Service}
/// 이무브 백엔드로 http 요청을 처리하는 Wrapper 클래스
class EmoovHttpClient
{
  final AppUserNotifier appUserNotifier;
  final SecureStorageService secureStorageService;
  final String csmsDomainName;
  final String socialServiceDomainName;

  EmoovHttpClient({
    required this.appUserNotifier,
    required this.secureStorageService,
    required this.csmsDomainName,
    required this.socialServiceDomainName
  });

  Dio appUserAuthClient()
  {
    Dio dio = Dio(BaseOptions(
        baseUrl: csmsDomainName,
        contentType: Headers.jsonContentType
    ));

    dio.interceptors.clear();
    dio.interceptors.add(AuthRequestInterceptor(
        csmsDomainName: csmsDomainName,
        secureStorageService: secureStorageService,
        appUserNotifier: appUserNotifier,
        originalDio: dio)
    );

    return dio;
  }

  Dio client()
  {
    return Dio(BaseOptions(
        baseUrl: csmsDomainName,
        contentType: Headers.jsonContentType
    ));
  }

  Dio socialClient()
  {
    return Dio(BaseOptions(
        baseUrl: socialServiceDomainName,
        contentType: Headers.jsonContentType
    ));
  }
}