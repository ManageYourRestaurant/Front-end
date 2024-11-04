import 'package:flutter/material.dart';
import 'package:front_end/presentation/widgets/dialog.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField(label: "아이디", hint: ""),
          // _buildTextField(
          //   label: "Birth of date",
          //   hint: "18/03/2024",
          //   suffixIcon: Icons.calendar_today,
          // ),
          // _buildTextField(label: "Phone Number", hint: "(454) 726-0592"),
          _buildTextField(
            label: "비밀번호",
            hint: "",
            obscureText: true,
            suffixIcon: Icons.visibility_off,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 48),
              // primary: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // 회원가입 처리 로직
                showSignupSuccessDialog(context);
              }
            },
            child: Text('회원가입', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    bool obscureText = false,
    IconData? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
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
