import 'dart:core';
import 'credit_card_bin_info.dart';

class CreditCard
{
  String sysId = '';
  String cardNumber = '';
  String cardNickName = '';
  bool isDefault = false;
  bool isValid = true;
  String cardStatus = '';
  CreditCardBinInfo binInfo;

  CreditCard({
    required this.sysId,
    required this.cardNumber,
    required this.cardNickName,
    required this.isDefault,
    required this.isValid,
    required this.cardStatus,
    required this.binInfo,
  });

  factory CreditCard.fromJson(Map<String, dynamic> jsonData)
  {
    return CreditCard(
      sysId: jsonData['paymentCardId'],
      cardNumber: jsonData['number'],
      cardNickName: jsonData['name'],
      isDefault: jsonData['isDefault'],
      isValid: jsonData['isValid'],
      cardStatus: jsonData['paymentCardStatus'],
      binInfo: CreditCardBinInfo.fromJson(jsonData['binInfo']),
    );
  }
}