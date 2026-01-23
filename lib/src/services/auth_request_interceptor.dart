
import 'package:dio/dio.dart';
import 'package:emoov_app_assets/emoov_app_assets.dart';
import 'package:logger/logger.dart';

import '../riverpod/app_user_notifier.dart';

/// {@category Service}
/// 인증 갱신을 위한 http 요청 인터셉터
/// ***
class AuthRequestInterceptor extends Interceptor
{
  final SecureStorageService secureStorageService;
  final AppUserNotifier appUserNotifier;
  final String csmsDomainName;
  final Dio originalDio;
  final logger = Logger();

  AuthRequestInterceptor({
    required this.secureStorageService,
    required this.appUserNotifier,
    required this.originalDio,
    required this.csmsDomainName
  });

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler) async
  {
    //final appUser = appUserNotifier.getAppUser();
    //final token = appUser?.token ?? '';

    final token = await secureStorageService.getAccessToken() ?? '';

    //logger.d('[EMOOV] App User Token: \n $token');
    options.headers['Authorization'] = 'Bearer $token';

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler) async
  {
    /// 인증 오류가 발생한 경우, 토큰 갱신을 요청
    if(err.response?.statusCode == 401) {

      final accessToken = await secureStorageService.getAccessToken();
      final refreshToken = await secureStorageService.getRefreshToken();

      if(refreshToken == null) {
        return handler.reject(err);
      }

      /// 토큰 갱신을 위해서 새로운 DIO로 요청
      final tempDio = Dio();
      tempDio.interceptors.clear();

      Map<String, dynamic> body = {
        "accessToken" : accessToken,
        "refreshToken" : refreshToken,
      };
      String endPoint = '$csmsDomainName/appuserauth/api/Auth2/refresh';

      try {
        final response = await tempDio.post(endPoint, data: body);

        if(response.statusCode == 200) {
          final newToken = response.data['AccessToken'];
          final newRefreshToken = response.data['RefreshToken'];
          final newExpiredDate = response.data['ExpiredDate'];

          /// 저장소 정보를 갱신
          await secureStorageService.setAccessToken(newToken);
          await secureStorageService.setRefreshToken(newRefreshToken);
          await secureStorageService.setExpiredDate(newExpiredDate);
          /// 뷰모델 정보도 갱신
          final user = appUserNotifier.getAppUser();
          if(user != null) {
            user.token = newToken;
            user.refreshToken = newRefreshToken;
            user.expiredDate = newExpiredDate;
            appUserNotifier.setAppUser(user);
          }
          else{
            AppUser newUser = AppUser(
              username: (await secureStorageService.getUserName())!,
              token: newToken,
              signInId: (await secureStorageService.getSignInId())!,
              sysId: (await secureStorageService.getUserId())!,
              phoneNumber: (await secureStorageService.getPhoneNumber())!,
              refreshToken: newRefreshToken,
              nickName: '',
              expiredDate: newExpiredDate,
            );
            appUserNotifier.setAppUser(newUser);
          }
          logger.d('[EMOOV ${DateTime.now().toString()}] 토근의 유효기간이 종료되어 토큰을 재발급 받았습니다.');

          /// 오류가 발생한 요청에 대해서 인증정보를 갱신
          err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
          /// 오류에 포함된 요청정보를 이용하여 새로운 요청을 생성
          final clonedRequest = await originalDio.request(
            err.requestOptions.path,
            options: Options(
              method: err.requestOptions.method,
              headers: err.requestOptions.headers,
            ),
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );
          /// 새로운 요청을 전송
          return handler.resolve(clonedRequest);
        }
      }
      catch (err) {
        /// 토큰 갱신을 요청에서 다시 오류가 발생하는 경우라면, 토큰과 사용자정보를 삭제
        appUserNotifier.clearAppUser();
        await secureStorageService.clearToken();
      }
    }
    else if(err.response?.statusCode == 451) {

    }
    else if(err.response?.statusCode == 400) {
      final errData = err.response?.data;
    }

    super.onError(err, handler);
  }
}