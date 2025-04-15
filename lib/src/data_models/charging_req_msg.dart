/// @{category DataModel}
/// 충전요청 메시지 데이터 모델
class ChargingReqMsg
{
  String uniqueId = '';
  String messageType = '';
  Map<String, dynamic> data = {};

  ChargingReqMsg({
    required this.uniqueId,
    required this.messageType,
    required this.data
  });

  factory ChargingReqMsg.fromJson(Map<String, dynamic> jsonData)
  {
    return ChargingReqMsg(
        uniqueId: jsonData['uniqueId'],
        messageType: jsonData['messageType'],
        data: jsonData['data']
    );
  }
}