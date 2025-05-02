import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// @{category Service}
/// 보안저장소 서비스
class SecureStorageService
{
  final storage = const FlutterSecureStorage();

  Future<void> setAccessToken(String value) async
  {
    await storage.write(key: 'access-token', value: value);
  }

  Future<String?> getAccessToken() async
  {
    return await storage.read(key: 'access-token');
  }

  Future<void> setRefreshToken(String value) async
  {
    await storage.write(key: 'refresh-token', value: value);
  }

  Future<String?> getRefreshToken() async
  {
    return await storage.read(key: 'refresh-token');
  }

  Future<void> setSignInId(String value) async
  {
    await storage.write(key: 'user-name', value: value);
  }

  Future<void> setUserId(String value) async
  {
    await storage.write(key: 'user-id', value: value);
  }

  Future<void> setUserRole(String value) async
  {
    await storage.write(key: 'user-role', value: value);
  }

  Future<void> setUserPassword(String value) async
  {
    await storage.write(key: 'user-password', value: value);
  }

  Future<void> setExpiredDate(String value) async
  {
    await storage.write(key: 'expired-date', value: value);
  }

  Future<String?> getExpiredDate() async
  {
    return await storage.read(key: 'expired-date');
  }

  Future<String?> getSignInId() async
  {
    return await storage.read(key: 'user-name');
  }

  Future<String?> getUserId() async
  {
    return await storage.read(key: 'user-id');
  }

  Future<String?> getPassword() async
  {
    return await storage.read(key: 'user-password');
  }

  Future<String?> getUserRole() async
  {
    return await storage.read(key: 'user-role');
  }

  Future<String?> getUserName() async
  {
    return await storage.read(key: 'user-name');
  }

  Future<void> clearAll() async
  {
    await storage.delete(key: 'access-token');
    await storage.delete(key: 'refresh-token');
    await storage.delete(key: 'expired-date');
    await storage.delete(key: 'user-name');
    await storage.delete(key: 'user-id');
    await storage.delete(key: 'user-role');
    await storage.delete(key: 'user-password');
  }

  Future<void> clearToken() async
  {
    await storage.delete(key: 'access-token');
    await storage.delete(key: 'refresh-token');
    await storage.delete(key: 'expired-date');
  }

  Future<String> print() async
  {
    final userSysId = await storage.read(key: 'user-id');
    final userName = await storage.read(key: 'user-name');
    final userPassword = await storage.read(key: 'user-password');
    final userRole = await storage.read(key: 'user-role');
    final accessToken = await storage.read(key: 'access-token');
    final refreshToken = await storage.read(key: 'refresh-token');

    String rv = 'Secure Storage: \n'
        'user-id: $userSysId \n'
        'user-name: $userName \n'
        'user-role: $userRole \n'
        'access-token: $accessToken \n'
        'refresh-token: $refreshToken \n';

    return rv;
  }
}