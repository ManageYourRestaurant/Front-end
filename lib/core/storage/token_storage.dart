// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class TokenStorage {
//   static const _storage = FlutterSecureStorage();
//   static const _keyToken = 'auth_token';

//   // 토큰 저장
//   static Future<void> saveToken(String token) async {
//     await _storage.write(key: _keyToken, value: token);
//   }

//   // 토큰 가져오기
//   static Future<String?> getToken() async {
//     return await _storage.read(key: _keyToken);
//   }

//   // 토큰 삭제
//   static Future<void> deleteToken() async {
//     await _storage.delete(key: _keyToken);
//   }
// }
