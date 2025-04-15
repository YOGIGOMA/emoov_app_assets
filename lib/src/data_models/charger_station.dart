import 'dart:core';

/// {@category DataModel}
class ChargerStation {

  int sysId = 0;
  String stationName = '';
  String stationId = '';
  String address = '';
  double lat = 0.0;
  double lng = 0.0;
  String businessId = '';
  String businessName = '';
  String businessCall = '';
  String facilityKind = '';
  String facilityKindDetail = '';
  String parkingFee = '';
  int isRestrictedArea = 0;
  int regionCode = 0;
  double? highSpdChargingFee = 0.0;
  double? lowSpdChargingFee = 0.0;
  int countTo7 = 0;
  int count10To50 = 0;
  int count51To100 = 0;
  int count101To200 = 0;
  int count201To300 = 0;
  int countOver300 = 0;
  int hasDcCHAdeMo = 0;
  int hasDcCombo1 = 0;
  int hasAcType1 = 0;
  int hasAcType2 = 0;
  int hasNACS = 0;
  double distance = 0.0;

  ChargerStation({
    required this.sysId,
    required this.stationName,
    required this.stationId,
    required this.address,
    required this.lat,
    required this.lng,
    required this.businessId,
    required this.businessCall,
    required this.businessName,
    required this.facilityKind,
    required this.facilityKindDetail,
    required this.parkingFee,
    required this.isRestrictedArea,
    required this.regionCode,
    required this.highSpdChargingFee,
    required this.lowSpdChargingFee,
    required this.countTo7,
    required this.count10To50,
    required this.count51To100,
    required this.count101To200,
    required this.count201To300,
    required this.countOver300,
    required this.hasDcCHAdeMo,
    required this.hasAcType1,
    required this.hasAcType2,
    required this.hasDcCombo1,
    required this.hasNACS,
    required this.distance,
  });
}