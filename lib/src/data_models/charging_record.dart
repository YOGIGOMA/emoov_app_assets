/// {@category DataModel}
/// 충전 내역 데이터 클래스
class ChargingRecord
{
  DateTime startDate;
  DateTime endDate;
  double amountOfMoney = 0;
  double amountOfCharging = 0.0;
  int unitPrice = 0;
  bool isChargingCompleted;
  bool isPaymentCompleted;

  ChargingRecord({
    required this.startDate,
    required this.endDate,
    required this.amountOfMoney,
    required this.amountOfCharging,
    required this.unitPrice,
    required this.isChargingCompleted,
    required this.isPaymentCompleted,
  });

  factory ChargingRecord.fromJson(Map<String, dynamic> jsonData)
  {

    int aoc = (jsonData['meterStop'] - jsonData['meterStart']);
    double payment = jsonData['chargingFee'].toDouble();
    DateTime startDate = DateTime.parse('0001-01-01 00:00:00');
    DateTime endDate = DateTime.parse('0001-01-01 00:00:00');

    if(jsonData['chargingStartedDate'] != null) {
      startDate = DateTime.parse(jsonData['chargingStartedDate']);
    }
    if(jsonData['chargingCompletedDate'] != null) {
      endDate = DateTime.parse(jsonData['chargingCompletedDate']);
    }

    return ChargingRecord(
      startDate: startDate,
      endDate: endDate,
      amountOfMoney: payment,
      amountOfCharging: aoc.toDouble(),
      unitPrice: jsonData['unitPrice'],
      isChargingCompleted: jsonData['chargingCompleted'],
      isPaymentCompleted: jsonData['paymentCompleted'],
    );
  }
}