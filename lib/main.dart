import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instituto/features/auth/screens/login_screen.dart';
import 'package:instituto/features/auth/screens/signup_screens/signup_screen.dart';
import 'package:instituto/router.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await GetStorage.init();
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
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
        onGenerateRoute: (settings) =>
            genarateRoute(settings), // auto genarating routes
        home: LoginScreen());
  }
}
