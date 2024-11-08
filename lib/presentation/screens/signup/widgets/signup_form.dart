import 'package:flutter/material.dart';
import 'package:front_end/core/api/auth_api.dart';
import 'package:front_end/presentation/widgets/dialog.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _authApi = AuthApi(); // AuthApi 인스턴스 생성
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _handleSignup() async {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;

      // 회원가입 API 호출
      final success = await _authApi.signup(username, password);

      if (success) {
        // 회원가입 성공 시 성공 다이얼로그 표시
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("회원가입 성공"),
            content: Text("회원가입이 완료되었습니다."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // 다이얼로그 닫기
                  Navigator.pop(context); // 회원가입 화면 닫기
                },
                child: Text("확인"),
              ),
            ],
          ),
        );
      } else {
        // 회원가입 실패 시 실패 다이얼로그 표시
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("회원가입 실패"),
            content: Text("회원가입 중 오류가 발생했습니다. 다시 시도해 주세요."),
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // 아이디 입력 필드
          _buildTextField(
            controller: _usernameController,
            label: "아이디",
            hint: "",
          ),

          // 비밀번호 입력 필드
          _buildTextField(
            controller: _passwordController,
            label: "비밀번호",
            hint: "",
            obscureText: true,
            suffixIcon: Icons.visibility_off,
          ),

          // 회원가입 버튼
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: _handleSignup, // 회원가입 처리 함수 호출
            child: Text('회원가입', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool obscureText = false,
    IconData? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
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
