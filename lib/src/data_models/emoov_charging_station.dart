import 'package:geolocator/geolocator.dart';

/// @{category DataModel}
/// 이무브 충전소정보 데이터모델
class EmoovChargingStation
{
  int stationSysId;
  String stationName;
  String ownerName;
  String operatorName;
  String address;
  String detailAddress;
  double? lat;
  double? lng;
  double? distanceValue;
  String? distance;

  EmoovChargingStation({
    required this.stationSysId,
    required this.stationName,
    required this.ownerName,
    required this.operatorName,
    required this.address,
    required this.detailAddress,
  });

  factory EmoovChargingStation.fromJson(Map<String, dynamic> jsonData, double myLat, double myLng)
  {
    var station = EmoovChargingStation(
      stationSysId: jsonData['ChargingStationId'] ?? -1,
      stationName: jsonData['ChargingStationName'] ?? '',
      ownerName: jsonData['OwnerName'] ?? '',
      operatorName: jsonData['OperatorName'] ?? '',
      address: jsonData['Address'] ?? '',
      detailAddress: jsonData['DetailAddress'] ?? '',
    );

    if(jsonData['Latitude'] != null && jsonData['Longitude'] != null) {

      double distance = Geolocator.distanceBetween(
          myLat, myLng,
          jsonData['Latitude'], jsonData['Longitude']
      );
      station.distanceValue = distance;

      String? distanceStr;
      distanceStr = (distance / 1000).toStringAsFixed(1); // 미터를 킬로미터로 변환

      station.lat = jsonData['Latitude'];
      station.lng = jsonData['Longitude'];
      station.distance = distanceStr;
    }

    return station;
  }
}