/// @{category DataModel}
/// 충전소 검색 필터 데이터 모델
class StationSearchFilter
{
  double searchingRadius = 0.25;
  bool onlyAccessible = true;
  int minChargingWatt = 7;
  List<String> connectorTypes = [];
  List<String> facilityTypes = [];
  List<String> cpos = [];
  List<String> chargingSpeeds = [];

  StationSearchFilter({
    required this.cpos,
    required this.searchingRadius,
    required this.onlyAccessible,
    required this.minChargingWatt,
    required this.connectorTypes,
    required this.chargingSpeeds,
    required this.facilityTypes,
  });
}