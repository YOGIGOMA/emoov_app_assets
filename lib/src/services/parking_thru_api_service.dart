
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:xml/xml.dart';
import '../../emoov_app_assets.dart';

/// {@category Service}
/// 파킹스루 서비스 API 클래스
/// iOS 플랫폼에서만 사용가능
class ParkingThruApiService
{
  /// <summary>
  /// 고유한 TagId 번호를 요청한다.
  /// </summary>
  Future<Map<String, dynamic>> getUniqueIdTagNumberAsync(
      String parkingThruDomainName,
      String token) async
  {
    Map<String, dynamic> result = {
      'success': false,
      'uniqueIdTagNumber': '',
      'code': '',
      'msg:': ''
    };

    String endPoint2 = '$parkingThruDomainName/service/requestNo.do';
    Map<String, String> body2 = {
      'issuerType': 'YrfLGMQqlnPvphp2vh0h0Q=='
    };
    final jsonBody2 = jsonEncode(body2);

    try{
      Dio dio = Dio();

      final response2 = await dio.post(endPoint2,
          data: jsonBody2,
          options: Options(
              headers: {'apiToken': token}
          )
      );

      if(response2.statusCode == 200) {
        final document2 = XmlDocument.parse(response2.data);
        final idEpElement = document2.findAllElements('idEp');

        if(idEpElement.isNotEmpty) {
          final idEp = idEpElement.first.innerText;
          //log('[EMOOV] ParkingThru Api Service > Enc ID : ${result['uniqueIdTagNumber']}');
          final decId = EncryptionUtil.aes(idEp, 'mfmember', false);
          //log('[EMOOV] ParkingThru Api Service > Dec ID : $decId');
          result['uniqueIdTagNumber'] = decId;
          result['success'] = true;
        }
        result['code'] = document2.findAllElements('code').first.innerText;
        result['msg'] = document2.findAllElements('msg').first.innerText;
      }
    }
    catch(err) {
      log('[EMOOV] Exception on ParkingThurApiService::getUniqueIdTagNumber(): $err');
    }

    return result;
  }

  /// <summary>
  /// 파킹스루 API 사용을 위한 토큰을 요청
  /// API 사용전에 가장 먼저 호출을 해야 함
  /// </summary>
  Future<Map<String, dynamic>> getTokenAsync(String parkingThruDomainName, String idNumber) async
  {
    idNumber = idNumber.replaceAll('-', '');
    if(idNumber.length > 40) {
      idNumber = idNumber.substring(0, 40);
    }

    String para = "{"
          "\"apiToken\":\"MemberShipAuthTokenRequest\","
          "\"idCenter\":\"36\","
          "\"phoneNo\":\"$idNumber\","
          "\"device\":\" \","
          "\"model\":\" \","
          "\"osType\":\"2\","
          "\"appVer\":\"1.0\","
          "\"loginId\":\"kelon\""
        "}";

    log('[EMOOV] ParkingThru Api Service: $para');

    int timestamp = DateTime.now().millisecondsSinceEpoch;
    String requestData = "$para$timestamp";
    String enc = EncryptionUtil.aes(requestData, 'mfmember', true);

    String endPoint = '$parkingThruDomainName/service/apiToken.do';

    Map<String, dynamic> result = {
      'success': false,
      'apiToken': '',
      'code': '',
      'msg:': ''
    };

    Map<String, String> body =  {
      'custInfo': enc
    };

    final jsonBody = jsonEncode(body);

    log('[EMOOV] ParkingThru Api Service: $jsonBody');

    try{
      Dio dio = Dio();

      final response = await dio.post(endPoint,
        data: jsonBody,
        options: Options(
          headers: {'apiToken': 'MemberShipAuthTokenRequest'}
        )
      );

      if(response.statusCode == 200)
      {
        final document = XmlDocument.parse(response.data);
        final apiTokenElement = document.findAllElements('apiToken');

        if(apiTokenElement.isNotEmpty) {
          result['success'] = true;
          result['apiToken'] = apiTokenElement.first.innerText;
        }
        else {
          result['success'] = false;
        }
        result['code'] = document.findAllElements('code').first.innerText;
        result['msg'] = document.findAllElements('msg').first.innerText;
      }
    }
    catch(err) {
      log('[EMOOV] Exception on ParkingThurApiService::getTokenAsync(): $err');
    }

    return result;
  }
}