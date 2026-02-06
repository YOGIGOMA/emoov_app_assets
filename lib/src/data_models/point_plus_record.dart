import 'package:emoov_app_assets/src/data_models/point_usage_record.dart';
import 'package:intl/intl.dart';

class PointPlusRecord
{
  String requestId = '';
  int point = 0;
  String reason = '';
  String date = '';
  String expiryDate = '';
  String note = '';
  List<PointUsageRecord> usageRecords = [];

  PointPlusRecord({
    required this.requestId,
    required this.point,
    required this.reason,
    required this.date,
    required this.expiryDate,
    required this.note,
    required this.usageRecords,
  });

  factory PointPlusRecord.fromJson(Map<String, dynamic> jsonData)
  {
    String expiryLocalDateStr = '';
    String plusLocalDateStr = '';

    if(jsonData['Date'] != null) {
      final localDate = DateTime.parse(jsonData['Date']).toLocal();
      plusLocalDateStr = DateFormat('yyyy-MM-dd HH:mm:ss').format(localDate);
    }

    if(jsonData['ExpiryDate'] != null) {
      final localDate = DateTime.parse(jsonData['ExpiryDate']).toLocal();
      expiryLocalDateStr = DateFormat('yyyy-MM-dd HH:mm:ss').format(localDate);
    }

    List<PointUsageRecord> usageRecords = (jsonData['UsageRecords'] as List)
        .map((x) => PointUsageRecord.fromJson(x)).toList();

    return PointPlusRecord(
        requestId: jsonData['RequestId'],
        point: jsonData['Point'] as int,
        reason: jsonData['Reason'],
        date: plusLocalDateStr,
        expiryDate: expiryLocalDateStr,
        note: jsonData['Note'] ?? '',
        usageRecords: usageRecords
    );
  }
}