import 'payment.dart';

/// {@category DataModel}
/// 주문 결제 목록 데이터 클래스
class OrderPayment
{
  String orderId = '';
  List<Payment> payments = [];

  OrderPayment({
    required this.orderId,
    required this.payments,
  });

  factory OrderPayment.fromJson(Map<String, dynamic> jsonData)
  {
    List<Payment> paymentList = [];
    if (jsonData['payments'] != null && jsonData['payments'] is List) {
      paymentList = (jsonData['payments'] as List)
          .map((payment) => Payment.fromJson(payment as Map<String, dynamic>))
          .toList();
    }

    return OrderPayment(
      orderId: jsonData['orderId'] as String? ?? '',
      payments: paymentList,
    );
  }
}
