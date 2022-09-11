import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/controller/auth_controllers.dart';

import 'package:instituto/features/auth/screens/login_screen.dart';
import 'package:instituto/features/auth/screens/home/request/teacher_request.dart';
import 'package:instituto/features/auth/screens/signup_screens/signup_screen.dart';
import 'package:instituto/router.dart';

import 'features/auth/screens/custom_bottom_navigation.dart';
import 'features/auth/screens/home/home_screen.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authController = Get.put((AuthController()));

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instituto',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
        onGenerateRoute: (settings) =>
            genarateRoute(settings), // auto genarating routes
        home: (HomePage()));
  }
}
