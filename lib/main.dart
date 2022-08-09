import 'package:flutter/material.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/features/auth/screens/landing_screen.dart';
import 'package:instituto/features/auth/screens/login_screen.dart';
import 'package:instituto/features/auth/screens/signup_screens/signup_screen.dart';
import 'package:instituto/router.dart';
import 'constants/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instituto',
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: (settings) =>
            genarateRoute(settings), // auto genarating routes
        home: const LoginScreen());
  }
}
