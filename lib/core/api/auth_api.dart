import 'dart:convert';
import 'package:front_end/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  // 로그인 API 요청 함수
  Future<bool> login(String username, String password) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/auth/jwt/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'username': username,
        'password': password,
      },
    );

    print(response.body);
    // jwt token은 추후 저장
    if (response.statusCode == 200) {
      // 성공적으로 로그인한 경우 true 반환
      return true;
    } else {
      // 로그인 실패 시 false 반환
      return false;
    }
  }

  Future<bool> signup(String email, String password) async {
    final url = Uri.parse(
        '${ApiConstants.baseUrl}/auth/register/register'); // 실제 API 엔드포인트로 변경
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    print(response.body);
    if (response.statusCode == 201) {
      // 회원가입 성공
      return true;
    } else {
      // 회원가입 실패
      return false;
    }
  }
}
