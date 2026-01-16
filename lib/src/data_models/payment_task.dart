/// {@category DataModel}
/// 결제 작업 데이터 클래스
class PaymentTask
{
  String paymentTaskId = '';
  String paymentTaskType = '';
  String taskStatus = '';
  bool isSuccess = false;
  String errorCode = '';
  String failMessage = '';
  String cancelReason = '';
  String pgTransactionId = '';
  String cardApprovalNumber = '';
  DateTime? createdDate;
  DateTime? completedDate;
  String beforePaymentStatus = '';
  String afterPaymentStatus = '';

  PaymentTask({
    required this.paymentTaskId,
    required this.paymentTaskType,
    required this.taskStatus,
    required this.isSuccess,
    required this.errorCode,
    required this.failMessage,
    required this.cancelReason,
    required this.pgTransactionId,
    required this.cardApprovalNumber,
    this.createdDate,
    this.completedDate,
    required this.beforePaymentStatus,
    required this.afterPaymentStatus,
  });

  factory PaymentTask.fromJson(Map<String, dynamic> jsonData)
  {
    DateTime? parseDate(String? dateStr) {
      if (dateStr == null || dateStr.isEmpty) return null;
      try {
        return DateTime.parse(dateStr);
      } catch (e) {
        return null;
      }
    }

    return PaymentTask(
      paymentTaskId: jsonData['paymentTaskId'] as String? ?? '',
      paymentTaskType: jsonData['paymentTaskType'] as String? ?? '',
      taskStatus: jsonData['taskStatus'] as String? ?? '',
      isSuccess: jsonData['isSuccess'] as bool? ?? false,
      errorCode: jsonData['errorCode'] as String? ?? '',
      failMessage: jsonData['failMessage'] as String? ?? '',
      cancelReason: jsonData['cancelReason'] as String? ?? '',
      pgTransactionId: jsonData['pgTransactionId'] as String? ?? '',
      cardApprovalNumber: jsonData['cardApprovalNumber'] as String? ?? '',
      createdDate: parseDate(jsonData['createdDate'] as String?),
      completedDate: parseDate(jsonData['completedDate'] as String?),
      beforePaymentStatus: jsonData['beforePaymentStatus'] as String? ?? '',
      afterPaymentStatus: jsonData['afterPaymentStatus'] as String? ?? '',
    );
  }
}
