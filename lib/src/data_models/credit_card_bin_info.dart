import 'dart:core';

/// @{categpru DataModel}
/// 신용카드 BIN정보 데이터 모델
class CreditCardBinInfo
{
  String issuerName = '';
  String bin = '';
  String chitName = ''; // 전표인수명
  String kind = ''; // 법인 또는 개인
  String brand = ''; // 카드 브랜드명
  String paymentType = ''; // 지불방식, 신용 또는 체크

  CreditCardBinInfo({
    required this.issuerName,
    required this.bin,
    required this.chitName,
    required this.kind,
    required this.brand,
    required this.paymentType
  });

  factory CreditCardBinInfo.fromJson(Map<String, dynamic> jsonData)
  {
    return CreditCardBinInfo(
        issuerName: jsonData['issuer'],
        bin: jsonData['bin'],
        paymentType: jsonData['cardType'],
        brand: jsonData['brand'],
        kind: jsonData['entityType'],
        chitName: jsonData['receiptName']
    );
  }
}
