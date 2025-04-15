
/// @{category DataModel}
/// 충전시설의 충전기정보 데이터모델
class InfraChargerInfo
{
  String chargerSysId = '';
  String chargerDisplayNumber = '';
  int chargingStationId = -1;
  String chargingStationName = '';
  String cpoSysId = '';
  String cpoName = '';

  InfraChargerInfo({
    required this.chargerSysId,
    required this.chargerDisplayNumber,
    required this.chargingStationId,
    required this.chargingStationName,
    required this.cpoSysId,
    required this.cpoName,
  });

  factory InfraChargerInfo.fromJson(Map<String, dynamic> jsonData)
  {
    final stationId = jsonData['ChargingStation']['ChargingStationId'];
    final stationName = jsonData['ChargingStation']['ChargingStationName'];

    final station = jsonData['ChargingStation'];
    final cpoData = station['Cpo'];

    final CpoInfo cpo = CpoInfo.fromJson(cpoData);

    return InfraChargerInfo(
      chargerSysId: jsonData['ChargerId'],
      chargerDisplayNumber: jsonData['DisplaySerialNumber'],
      chargingStationId: stationId,
      chargingStationName: stationName,
      cpoSysId: cpo.cpoId,
      cpoName: cpo.name,
    );
  }
}

/// @{category DataModel}
/// 충전사업자 정보 데이터모델
class CpoInfo
{
  String cpoId = '';
  String name = '';

  CpoInfo({
    required this.cpoId,
    required this.name,
  });

  factory CpoInfo.fromJson(Map<String, dynamic> jsonData)
  {
    return CpoInfo(
        cpoId: jsonData['CpoId'],
        name: jsonData['Name']
    );
  }

}