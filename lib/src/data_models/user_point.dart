
/// @{category DataModel}
/// 사용자의 포인트정보 데이터모델
class UserPoint
{
  String userId = '';
  int point = 0;

  UserPoint({
    required this.point,
    required this.userId,
  });

  factory UserPoint.fromJson(Map<String, dynamic> jsonData)
  {
    return UserPoint(
      userId: jsonData['UserId'],
      point: jsonData['Point'],
    );
  }
}