import 'package:flutter/material.dart';
import 'package:front_end/config/routes.dart';
import 'presentation/screens/signin/signin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.signin,
        onGenerateRoute: generateRoute,
        builder: (context, child) {
          return SafeArea(child: child!);
        });
  }
}
