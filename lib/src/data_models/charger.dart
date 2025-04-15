
/// @{category DataModel}
/// 충전기 기본 데이터 모델
class Charger {

  int chargerSysId = -1;
  String chargerIdStr = "";
  bool available = false;
  int stat = 0;
  String statUpdDt = "";
  String powerOutPut = "";
  String chargerType = "";
  double averageRating = 0;
  int numOfRating = 0;
  int numOfErrorRating = 0;
  String reliability = "";
  String autoReviewMessage = "";
  double averageRealSpeed = 0.0;
  String lastChargingEndTime = "";

  Charger({
    required this.chargerSysId,
    required this.chargerIdStr,
    required this.available,
    required this.stat,
    required this.statUpdDt,
    required this.averageRating,
    required this.powerOutPut,
    required this.chargerType,
    required this.numOfRating,
    required this.numOfErrorRating,
    required this.reliability,
    required this.autoReviewMessage,
    required this.averageRealSpeed,
    required this.lastChargingEndTime,
  });

  factory Charger.fromJson(Map<String, dynamic> jsonData){
    return Charger(
      chargerSysId: jsonData["ID"],
      chargerIdStr: jsonData["ChargerIdStr"],
      available: (jsonData["Available"] == "YES") ? true : false,
      stat: int.parse(jsonData["Stat"]),
      statUpdDt: jsonData["StatUpdDt"],
      powerOutPut: jsonData["PowerOutput"],
      chargerType: jsonData["ChargerType"],
      averageRating: jsonData["AverageRating"],
      numOfRating: jsonData["NumOfRating"],
      numOfErrorRating: jsonData["NumOfErrorReporting"],
      reliability: jsonData["Reliability"],
      autoReviewMessage: jsonData["AutoReviewMessage"],
      averageRealSpeed: jsonData["AverageRealSpeed"],
      lastChargingEndTime: jsonData["LastChargingEndTime"],
    );
  }
}