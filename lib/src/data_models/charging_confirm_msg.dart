/// @{category DataModel}
/// 충전요청 확인 메시지 데이터 모델
class ChargingConfirmMsg
{
  String uniqueId = '';
  String messageType = '';
  String? status;

  ChargingConfirmMsg({
    required this.uniqueId,
    required this.messageType,
    this.status,
  });

  factory ChargingConfirmMsg.fromJson(Map<String, dynamic> jsonData)
  {
    return ChargingConfirmMsg(
      uniqueId: jsonData['uniqueId'],
      messageType: jsonData['messageType'],
      status: jsonData['status'],
    );
  }
}