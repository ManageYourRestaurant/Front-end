import 'package:flutter/material.dart';

void showSignupSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // 다이얼로그 외부 클릭 시 닫히지 않도록 설정
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 48,
            ),
            SizedBox(height: 16),
            Text(
              '회원가입이 완료되었습니다.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 다이얼로그 닫기
              Navigator.pop(context); // 회원가입 화면 닫기
            },
            child: Text("확인", style: TextStyle(color: Colors.blue)),
          ),
        ],
      );
    },
  );
}
