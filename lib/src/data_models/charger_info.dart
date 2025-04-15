
/// {@category DataModel}
/// 서버로 부터 받아오는 충전기 정보 데이터 객체
class ChargerInfo
{
  String chargerSysId = '';
  int actionSetId = -1;
  String actionSetName = '';
  String cpoSysId = '';
  int chargingStationSysId = -1;
  bool connected = false;
  List<ConnectorInfo> connectors = [];

  ChargerInfo({
    required this.chargerSysId,
    required this.actionSetId,
    required this.actionSetName,
    required this.cpoSysId,
    required this.chargingStationSysId,
    required this.connected,
    required this.connectors,
  });

  factory ChargerInfo.fromJson(Map<String, dynamic> jsonData)
  {
    final List<ConnectorInfo> connectors = [];

    for(final connector in jsonData['connectors'])
    {
      connectors.add(ConnectorInfo.fromJson(connector));
    }

    return ChargerInfo(
      chargerSysId: jsonData['chargerId'],
      //chargerDisplayNumber: jsonData['chargeP'],
      actionSetId: jsonData['actionSetId'],
      actionSetName: jsonData['actionSetName'],
      cpoSysId: jsonData['cpoId'],
      chargingStationSysId: jsonData['chargingStationId'],
      connected: jsonData['connected'],
      connectors: connectors,
    );
  }
}

/// {@category DataModel}
/// 서버로 부터 받 아오는 충전기의 커넥터 정보 데이터 객체.
/// ChargerInfo 데이터 객체에 종속된 데이터 객체.
class ConnectorInfo
{
  int connectorId = 0;
  String status = '';
  List<String> connectorTypes = [];

  ConnectorInfo ({
    required this.connectorId,
    required this.status,
    required this.connectorTypes,
  });

  factory ConnectorInfo.fromJson(Map<String, dynamic> jsonData)
  {
    final List<String> types = [];
    for(final type in jsonData['connectorTypes'])
    {
      String temp = type as String;
      types.add(temp);
    }

    return ConnectorInfo(
      connectorId: jsonData['connectorId'],
      status: jsonData['status'] ?? 'NotAvailable',
      connectorTypes: types,
    );
  }
}