import 'dart:core';

/// {@category DataModel}
/// 주문 정보 데이터 클래스
class Order {
  String orderId;
  String orderName;
  String orderStatus;
  DateTime? createdDate;
  DateTime? modifiedDate;
  int amount;
  String currency;
  String userId;
  String cpoId;

  Order({
    required this.orderId,
    required this.orderName,
    required this.orderStatus,
    this.createdDate,
    this.modifiedDate,
    required this.amount,
    required this.currency,
    required this.userId,
    required this.cpoId,
  });

  factory Order.fromJson(Map<String, dynamic> jsonData) {
    return Order(
      orderId: jsonData['orderId'] as String? ?? '',
      orderName: jsonData['orderName'] as String? ?? '',
      orderStatus: jsonData['orderStatus'] as String? ?? '',
      createdDate: jsonData['createdDate'] != null ? DateTime.parse(jsonData['createdDate']) : null,
      modifiedDate: jsonData['modifiedDate'] != null ? DateTime.parse(jsonData['modifiedDate']) : null,
      amount: jsonData['amount'] as int? ?? 0,
      currency: jsonData['currency'] as String? ?? '',
      userId: jsonData['userId'] as String? ?? '',
      cpoId: jsonData['cpoId'] as String? ?? '',
    );
  }
}
