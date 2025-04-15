
/// @{category DataModel}
/// 충전상태 메시지 데이터
class ChargingStatusMsg
{
  String uniqueId;
  String messageType;
  ChargingStatusMsgData data;

  ChargingStatusMsg({
    required this.uniqueId,
    required this.messageType,
    required this.data
  });

  factory ChargingStatusMsg.fromJson(Map<String, dynamic> json)
  {
    return ChargingStatusMsg(
        uniqueId: json['uniqueId'],
        messageType: json['messageType'],
        data: ChargingStatusMsgData.fromJson(json['data'])
    );
  }
}

/// <summary>
/// 충전상태 메시지의 데이터 항목
/// </summary>
class ChargingStatusMsgData
{
  String chargerId;
  String startTime;
  int chargeAmount;
  double unitPrice;
  double? soc;

  ChargingStatusMsgData({
    required this.chargerId,
    required this.startTime,
    required this.chargeAmount,
    required this.unitPrice,
    required this.soc
  });

  factory ChargingStatusMsgData.fromJson(Map<String, dynamic> json) {
    return ChargingStatusMsgData(
        chargerId: json['chargerId'],
        startTime: json['startTime'],
        chargeAmount: json['chargeAmount'] as int,
        unitPrice: json['unitPrice'] as double,
        soc: (json['soc'] == null) ? null : json['soc'] as double
    );
  }
}