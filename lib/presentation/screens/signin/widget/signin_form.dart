import 'package:flutter/material.dart';
import 'package:front_end/config/routes.dart';
import 'package:front_end/core/api/auth_api.dart';

class SigninForm extends StatefulWidget {
  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final _formKey = GlobalKey<FormState>();
  final _authApi = AuthApi();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  Future<void> _handleLogin() async {
    // Form 위젯이 유효한지 검증
    if (_formKey.currentState?.validate() ?? false) {
      // null 체크 추가
      final username = _usernameController.text;
      final password = _passwordController.text;

      // 로그인 API 호출
      final success = await _authApi.login(username, password);

      if (success) {
        // 로그인 성공 시
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("로그인 성공"),
            content: Text("환영합니다!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // 다이얼로그 닫기
                  // Navigator.pushReplacementNamed(context, Routes.home); // 홈 화면으로 이동
                },
                child: Text("확인"),
              ),
            ],
          ),
        );
      } else {
        // 로그인 실패 시
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("로그인 실패"),
            content: Text("아이디 또는 비밀번호가 잘못되었습니다."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // 다이얼로그 닫기
                child: Text("확인"),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          // Form 위젯을 추가하여 _formKey 연결
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 아이디 입력 필드
              _buildTextField(
                controller: _usernameController,
                label: "아이디",
                hint: "",
                keyboardType: TextInputType.text,
              ),

              // 비밀번호 입력 필드
              _buildTextField(
                controller: _passwordController,
                label: "비밀번호",
                hint: "",
                obscureText: !_isPasswordVisible,
                suffixIcon: _isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                onSuffixIconPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),

              // 로그인 버튼
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _handleLogin, // 로그인 처리 함수 호출
                child: Text('로그인', style: TextStyle(fontSize: 16)),
              ),

              // 하단 링크 (비밀번호 찾기 | 아이디 찾기 | 회원가입)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // 비밀번호 찾기 로직
                    },
                    child: Text(
                      "비밀번호 찾기",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text("|", style: TextStyle(color: Colors.grey)),
                  TextButton(
                    onPressed: () {
                      // 아이디 찾기 로직
                    },
                    child: Text(
                      "아이디 찾기",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text("|", style: TextStyle(color: Colors.grey)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.signUp);
                    },
                    child: Text(
                      "회원가입",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool obscureText = false,
    IconData? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
    VoidCallback? onSuffixIconPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon),
                  onPressed: onSuffixIconPressed,
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $label';
          }
          return null;
        },
      ),
    );
  }
}
