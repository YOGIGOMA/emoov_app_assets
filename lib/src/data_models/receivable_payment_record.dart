/// {@category DataModel}
/// 미수금 내역 데이터 클래스
class ReceivablePaymentRecord
{
  String stationName;
  String chargerName;
  DateTime startDate;
  DateTime endDate;
  int amountOfCharging = 0;
  double unitPrice = 0.0;
  bool isChargingCompleted;
  bool isPaymentCompleted;
  int chargingFee = 0;
  String PaymentOrderId;

  ReceivablePaymentRecord({
    required this.stationName,
    required this.chargerName,
    required this.startDate,
    required this.endDate,
    required this.amountOfCharging,
    required this.unitPrice,
    required this.isChargingCompleted,
    required this.isPaymentCompleted,
    required this.chargingFee,
    required this.PaymentOrderId,
  });

  factory ReceivablePaymentRecord.fromJson(Map<String, dynamic> jsonData)
  {
    int aoc = (jsonData['meterStop'] - jsonData['meterStart']);
    DateTime startDate = DateTime.parse('0001-01-01 00:00:00');
    DateTime endDate = DateTime.parse('0001-01-01 00:00:00');

    if(jsonData['chargingStartedDate'] != null) {
      startDate = DateTime.parse(jsonData['chargingStartedDate']);
    }
    if(jsonData['chargingCompletedDate'] != null) {
      endDate = DateTime.parse(jsonData['chargingCompletedDate']);
    }

    return ReceivablePaymentRecord(
      chargerName: jsonData['chargerName'],
      stationName: jsonData['stationName'] ?? '',
      startDate: startDate,
      endDate: endDate,
      amountOfCharging: aoc,
      unitPrice: jsonData['unitPrice'],
      isChargingCompleted: jsonData['chargingCompleted'],
      isPaymentCompleted: jsonData['paymentCompleted'],
      chargingFee: jsonData['chargingFee'],
      PaymentOrderId: jsonData['orderId'] ?? '',
    );
  }
}