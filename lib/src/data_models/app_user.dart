
/// @{category DataModel}
/// 사용자인증정보 데이터모델
class AppUser
{
  String username = '';
  String signInId = '';
  String token = '';
  String sysId = '';
  String refreshToken = '';
  String nickName = '';
  String expiredDate = '';
  String phoneNumber = '';

  AppUser({
    required this.username,
    required this.token,
    required this.signInId,
    required this.sysId,
    required this.phoneNumber,
    required this.refreshToken,
    required this.nickName,
    required this.expiredDate
  });

  factory AppUser.fromJson(Map<String, dynamic> jsonData)
  {
    return AppUser(
        sysId: jsonData['UserSysId'],
        signInId: jsonData['SignInId'],
        username: jsonData['UserName'],
        nickName: jsonData['NickName'],
        phoneNumber: jsonData['PhoneNumber'] ?? '',
        token: jsonData['AccessToken'],
        refreshToken: jsonData['RefreshToken'],
        expiredDate: jsonData['ExpiredDate']
    );
  }

}