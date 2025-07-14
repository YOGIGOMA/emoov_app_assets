
import 'dart:convert';

/// @{category DataModel}
/// 이무브 충전기 데이터모델
class EmoovCharger
{
  String chargerSysId;
  String displaySerialNumber;
  String chargePointSerialNumber;
  String lastModifiedDate;
  bool connected;

  List<EmoovConnector> connectors = [];

  EmoovCharger({
    required this.chargerSysId,
    required this.displaySerialNumber,
    required this.chargePointSerialNumber,
    required this.lastModifiedDate,
    required this.connected,
  });

  factory EmoovCharger.fromJson(Map<String, dynamic> jsonData)
  {
    var charger = EmoovCharger(
      chargerSysId: jsonData['chargerId'] ?? '',
      displaySerialNumber: jsonData['displaySerialNumber'] ?? '',
      chargePointSerialNumber: jsonData['chargePointSerialNumber'] ?? '',
      lastModifiedDate: jsonData['lastModifiedDate'] ?? '',
      connected: jsonData['connected'] ?? false,
    );

    if(jsonData['connectors'] != null) {
      charger.connectors = List.generate(jsonData['connectors'].length,
              (index) => EmoovConnector.fromJson(jsonData['connectors'][index])
      );
    }

    return charger;
  }
}

/// @{category DataModel}
/// 이무브 충전기 커넥터의 데이터 모델
class EmoovConnector
{
  int connectorId;
  String status;
  List<String> connectorTypes = [];

  EmoovConnector({
    required this.connectorId,
    required this.status,
    required this.connectorTypes,
  });

  factory EmoovConnector.fromJson(Map<String, dynamic> jsonData)
  {
    List<dynamic> connectorTypes = jsonData['connectorTypes'];
    List<String> connectorTypesStr = List<String>.from(connectorTypes);

    var connector = EmoovConnector(
      connectorId: jsonData['connectorId'] ?? '',
      status: jsonData['status'] ?? '',
      connectorTypes: connectorTypesStr,
    );

    return connector;
  }
}