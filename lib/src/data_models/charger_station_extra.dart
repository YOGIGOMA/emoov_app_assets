
import 'dart:core';

import 'blob_image.dart';
import 'charger.dart';

/// @{category DataModel}
/// 충전소 부가정보 데이터 모델
/// 충전소 기본정보 이외에 앱에서 추가적으로 전시해야 하는 정보를 담고 있는 모델
class ChargerStationExtra {

  int stationSysId;
  List<Charger> chargerList= [];
  List<String>? hashTags;
  List<BlobImage>? images;

  ChargerStationExtra({
    required this.stationSysId,
    required this.chargerList,
    this.hashTags,
    this.images,
  });

  factory ChargerStationExtra.fromJson(Map<String, dynamic> jsonData)
  {
    var info =  ChargerStationExtra(
        stationSysId: jsonData['EvChargerStationId'],
        chargerList: (jsonData['EvChargerInfo'] != null)
            ? List.generate(
            jsonData['EvChargerInfo'].length,
                (index) => Charger.fromJson(jsonData['EvChargerInfo'][index])
        )
            : []
    );

    if(jsonData['HashTags'] != null) {
      info.hashTags = List.generate(
          jsonData['HashTags'].length,
              (index) => jsonData['HashTags'][index]
      );
    }

    if(jsonData['StationImages'] != null) {
      info.images = List.generate(
          jsonData['StationImages'].length,
              (index) => BlobImage.fromJson(jsonData['StationImages'][index])
      );
    }

    return info;
  }
}