import 'package:flutter/material.dart';
import 'package:front_end/config/routes.dart';

class SigninForm extends StatefulWidget {
  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 아이디 입력 필드
            _buildTextField(
              label: "아이디",
              hint: "",
              keyboardType: TextInputType.text,
            ),

            // 비밀번호 입력 필드
            _buildTextField(
              label: "비밀번호",
              hint: "",
              obscureText: !_isPasswordVisible,
              suffixIcon:
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              onSuffixIconPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),

            // 로그인 버튼
            // SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                // primary: Colors.grey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // 로그인 처리 로직
                }
              },
              child: Text('로그인', style: TextStyle(fontSize: 16)),
            ),

            // 추가 여백
            // SizedBox(height: 16),

            // 하단 링크 (비밀번호 찾기 | 아이디 찾기 | 회원가입)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 비밀번호 찾기
                TextButton(
                  onPressed: () {
                    // 비밀번호 찾기 로직
                  },
                  child: Text(
                    "비밀번호 찾기",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

                // 구분선
                Text("|", style: TextStyle(color: Colors.grey)),

                // 아이디 찾기
                TextButton(
                  onPressed: () {
                    // 아이디 찾기 로직
                  },
                  child: Text(
                    "아이디 찾기",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

                // 구분선
                Text("|", style: TextStyle(color: Colors.grey)),

                // 회원가입
                TextButton(
                  onPressed: () {
                    // 회원가입 로직
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
    );
  }

  Widget _buildTextField({
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
