import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:instituto/controller/auth_controllers.dart';
import 'package:instituto/features/batch/screens/chat_slide.dart';
import 'package:instituto/features/dashboard/screens/dashboard.dart';

import 'package:instituto/features/profile/screens/teacher_profile_page.dart';
import 'package:instituto/router.dart';

import 'features/chats/chats_screen.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
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
        // ignore: prefer_const_constructors
        home: (RecentChatsScreen())); //
  }
}
