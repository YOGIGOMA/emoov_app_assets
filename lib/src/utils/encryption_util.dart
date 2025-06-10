
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

/// {@category Utils}
/// 암호화 유틸 클래스
class EncryptionUtil
{
  static const int BLOCK_SIZE = 16;
  static const String charset = 'UTF-8';

  static String aes(String passPhrase, String password, bool isEncrypt) {
    try {
      final passBytes = Key.fromUtf8(password);
      //final iv = IV.fromUtf8(password);
      //log("KeyBytes: ${key.bytes}");

      final keyBytes = Uint8List(BLOCK_SIZE);
      final length = passBytes.length > BLOCK_SIZE ? BLOCK_SIZE : passBytes.length;
      keyBytes.setRange(0, length, passBytes.bytes);

      final key = Key(keyBytes);
      final iv = IV(keyBytes);
      
      final encryptor = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
      
      if(isEncrypt) {
        final encrypted = encryptor.encrypt(passPhrase, iv: iv);
        return encrypted.base64.toString();
      }
      else {
        final decryptedStr = encryptor.decrypt64(passPhrase, iv: iv);
        return decryptedStr;
      }
    } catch (e) {
      log('AES Error: $e');
      return '';
    }
  }
}