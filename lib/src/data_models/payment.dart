import 'payment_task.dart';

/// {@category DataModel}
/// 결제 데이터 클래스
class Payment
{
  String paymentId = '';
  String paymentStatus = '';
  String paymentCardId = '';
  String maskedCardNumber = '';
  String cardType = '';
  String cardCompany = '';
  String pgInfoId = '';
  int paidAmount = 0;
  int usedPoint = 0;
  DateTime? createdDate;
  DateTime? modifiedDate;
  List<PaymentTask> paymentTasks = [];

  Payment({
    required this.paymentId,
    required this.paymentStatus,
    required this.paymentCardId,
    required this.maskedCardNumber,
    required this.cardType,
    required this.cardCompany,
    required this.pgInfoId,
    required this.paidAmount,
    required this.usedPoint,
    this.createdDate,
    this.modifiedDate,
    required this.paymentTasks,
  });

  factory Payment.fromJson(Map<String, dynamic> jsonData)
  {
    DateTime? parseDate(String? dateStr) {
      if (dateStr == null || dateStr.isEmpty) return null;
      try {
        return DateTime.parse(dateStr);
      } catch (e) {
        return null;
      }
    }

    List<PaymentTask> tasks = [];
    if (jsonData['paymentTasks'] != null && jsonData['paymentTasks'] is List) {
      tasks = (jsonData['paymentTasks'] as List)
          .map((task) => PaymentTask.fromJson(task as Map<String, dynamic>))
          .toList();
    }

    return Payment(
      paymentId: jsonData['paymentId'] as String? ?? '',
      paymentStatus: jsonData['paymentStatus'] as String? ?? '',
      paymentCardId: jsonData['paymentCardId'] as String? ?? '',
      maskedCardNumber: jsonData['maskedCardNumber'] as String? ?? '',
      cardType: jsonData['cardType'] as String? ?? '',
      cardCompany: jsonData['cardCompany'] as String? ?? '',
      pgInfoId: jsonData['pgInfoId'] as String? ?? '',
      paidAmount: jsonData['paidAmount'] as int? ?? 0,
      usedPoint: jsonData['usedPoint'] as int? ?? 0,
      createdDate: parseDate(jsonData['createdDate'] as String?),
      modifiedDate: parseDate(jsonData['modifiedDate'] as String?),
      paymentTasks: tasks,
    );
  }
}
