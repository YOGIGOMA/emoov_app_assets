/// {@category DataModel}
/// 충전 내역 데이터 클래스
class ChargingRecord
{
  DateTime startDate;
  DateTime endDate;
  int chargingFee = 0;
  int amountOfCharging = 0;
  double unitPrice = 0.0;
  bool isChargingCompleted;
  bool isPaymentCompleted;
  String orderId = '';

  ChargingRecord({
    required this.startDate,
    required this.endDate,
    required this.chargingFee,
    required this.amountOfCharging,
    required this.unitPrice,
    required this.isChargingCompleted,
    required this.isPaymentCompleted,
    required this.orderId,
  });

  factory ChargingRecord.fromJson(Map<String, dynamic> jsonData)
  {

    int aoc = (jsonData['meterStop'] - jsonData['meterStart']);
    //double payment = jsonData['chargingFee'].toDouble();
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
      chargingFee: jsonData['chargingFee'],
      amountOfCharging: aoc,
      unitPrice: jsonData['unitPrice'],
      isChargingCompleted: jsonData['chargingCompleted'],
      isPaymentCompleted: jsonData['paymentCompleted'],
      orderId: jsonData['orderId'] as String? ?? '',
    );
  }
}