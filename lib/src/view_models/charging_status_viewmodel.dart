
/// @{category ViewModel}
/// 충전중 상태데이터를 전시하는 뷰모델
///
class ChargingStatusViewModel
{
  String chargingStage = '';
  String chargerId = '';
  String startTime = '';
  //int durationSeconds = 0;
  int amountOfCharging = 0;
  int chargingPrice = 0;
  double stateOfCharging = 0.0;

  ChargingStatusViewModel({
    required this.chargingStage,
    required this.chargerId,
    required this.startTime,
    //required this.durationSeconds,
    required this.amountOfCharging,
    required this.stateOfCharging,
  });
}