
/// @{category DataModel}
/// 포인트 사용기록 데이터모델
/// @deprecated 포인트 백엔드의 변경으로 사용하지 않을 예정. 앱에서 오류를 막기 위해서 일단 삭제하지 않고 유지 중
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