
import 'dart:developer';

import '../../emoov_app_assets.dart';

/// @{category Service}
/// 본인인증을 위한 서비스 계약 클래스
class IdVerifyingService
{
  final EmoovHttpClient httpClient;

  IdVerifyingService({required this.httpClient});

  Future<Map<String, dynamic>> getTransactionToken(
      String cpoSysId,
      String token,
      String publicKey,
      String clientTxId) async
  {
    Map<String, dynamic> result =  {
      'success': false,
      'encryptToken': null,
      'publicKey': null,
      'clientTxId': null
    };

    /// 화면이 다시 렌더링될때 키를 재발급 받는것을 막기 위한 조건
    if(token.isNotEmpty && publicKey.isNotEmpty && clientTxId.isNotEmpty) {
      result['success'] = true;
      result['encryptToken'] = token;
      result['publicKey'] = publicKey;
      result['clientTxId'] = clientTxId;

      return result;
    }

    String endPoint = '/idverifier/api/v1/Verification/$cpoSysId/get-token';

    try{
      final response = await httpClient.client().get(endPoint);

      if(response.statusCode == 200)
      {
        result['success'] = true;
        result['encryptToken'] = response.data['encryptMOKToken'];
        result['publicKey'] = response.data['publicKey'];
        result['clientTxId'] = response.data['clientTxId'];
      }
    }
    catch(err) {
      log('[EMOOV] Exception on IdVerifyingService.getTransactionToken():\n $err');
    }

    return result;
  }

  Future<Map<String, dynamic>> authRequest(
      String cpoSysId,
      String publicKey,
      String encryptToken,
      String providerId,
      String userName,
      String phoneNumber,
      String birthDay,
      String gender,
      String nation) async
  {
    Map<String, dynamic> result =  {
      'success': false,
      'encryptAuthToken': null,
    };

    Map<String, dynamic> dto = {
      'encryptToken': encryptToken,
      'publicKey': publicKey,
      'providerId': providerId,
      'realName': userName,
      'phoneNumber': phoneNumber,
      'birthDay': birthDay,
      'genderCode': gender,
      'nationCode': nation,
      'serviceUsageCode': '01005'
    };

    String endPoint = '/idverifier/api/v1/Verification/$cpoSysId/auth-request';

    try{
      final response = await httpClient.client().post(endPoint, data: dto);

      if(response.statusCode == 200)
      {
        final responseMsg = response.data['resultMsg'] as String;
        if(responseMsg == 'success')
        {
          result['success'] = true;
          result['encryptAuthToken'] = response.data['encryptMOKToken'];
          result['publicKey'] = response.data['publicKey'];
        }
        else {
          result['success'] = false;
          result['errorMsg'] = responseMsg;
        }
      }
    }
    catch(err) {
      log('[EMOOV] Exception on IdVerifyingService.authRequest():\n $err');
    }

    return result;
  }

  Future<Map<String, dynamic>> confirmRequest(
      String cpoSysId,
      String publicKey,
      String encryptToken,
      String clientTxId,
      String otp) async
  {
    Map<String, dynamic> result =  {
      'success': false,
    };

    Map<String, dynamic> dto = {
      'encryptAuthToken': encryptToken,
      'publicKey': publicKey,
      'clientTxId': clientTxId,
      'otp': otp
    };

    String endPoint = '/idverifier/api/v1/Verification/$cpoSysId/confirm-request';

    try{
      final response = await httpClient.client().post(endPoint, data: dto);

      if(response.statusCode == 200)
      {
        final responseMsg = response.data['resultMsg'] as String;
        if(responseMsg == 'success')
        {
          result['success'] = true;
        }
        else {
          result['success'] = false;
          result['errorMsg'] = responseMsg;
        }
      }
    }
    catch(err) {
      log('[EMOOV] Exception on IdVerifyingService.confirmRequest():\n $err');
    }

    return result;
  }
}