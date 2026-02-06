
import 'package:intl/intl.dart';

class PointUsageRecord
{
  String usasgeId = '';
  int usedPoint = 0;
  int requestedUsagePoint = 0;
  String usageDate = '';
  String chargingTransactionSysId = '';
  String chargingStationInfo = '';

  PointUsageRecord({
    required this.usasgeId,
    required this.usedPoint,
    required this.requestedUsagePoint,
    required this.usageDate,
    required this.chargingTransactionSysId,
    required this.chargingStationInfo,
  });

  factory PointUsageRecord.fromJson(Map<String, dynamic> jsonData)
  {
    String usageLocalDateStr = '';

    if(jsonData['UsageDate'] != null) {
      final localDate = DateTime.parse(jsonData['UsageDate']).toLocal();
      usageLocalDateStr = DateFormat('yyyy-MM-dd HH:mm:ss').format(localDate);
    }
    return PointUsageRecord(
      usasgeId: jsonData['UsageId'],
      usedPoint: jsonData['UsedPoint'] as int,
      requestedUsagePoint: jsonData['RequestedUsagePoint'] as int,
      usageDate: usageLocalDateStr,
      chargingTransactionSysId: jsonData['ChargingTransactionSysId'] ?? '',
      chargingStationInfo: jsonData['ChargingStationInfo'] ?? '',
    );
  }
}