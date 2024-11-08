import 'package:flutter/material.dart';
import 'package:front_end/presentation/screens/signin/widget/signin_form.dart';
import 'package:front_end/presentation/screens/signin/widget/social_login_buttons.dart';

class SigninScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
              children: [
                Text(
                  'Manage Your Restaurant',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(child: SigninForm()),
            SocialLoginButtons(),
          ],
        ),
      ),
    );
  }
}
