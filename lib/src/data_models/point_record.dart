
/// @{category DataModel}
/// 포인트 사용기록 데이터모델
class PointRecord
{
  String requestId = '';
  int point = 0;
  String reason = '';
  String date = '';
  //String category = '';

  PointRecord({
    required this.requestId,
    required this.point,
    required this.reason,
    required this.date,
    //required this.category,
  });

  factory PointRecord.fromJson(Map<String, dynamic> jsonData)
  {
    return PointRecord(
      requestId: jsonData['RequestId'],
      point: jsonData['Point'],
      reason: jsonData['Reason'],
      date: jsonData['Date'],
      //category: jsonData['category'],
    );
  }
}