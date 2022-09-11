import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instituto/features/auth/screens/home/batches/batches_screen.dart';
import 'package:instituto/features/auth/screens/home/chats/chats_screen.dart';
import 'package:instituto/features/auth/screens/home/home_screen.dart';
import 'package:instituto/features/auth/screens/home/notification/notification_screen.dart';
import 'package:instituto/features/auth/screens/home/request/teacher_request.dart';
import 'package:instituto/features/auth/screens/login_screen.dart';
import 'package:instituto/features/auth/screens/signup_screens/signup_screen.dart';

Route<dynamic> genarateRoute(RouteSettings routeSettings) {
  //  NOTE : auth routes, home flow ke routes ko alg alg file me bnakr idhr combine krna ha
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );

    case SignupScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignupScreen(),
      );
    case HomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomePage(),
      );
    case RecentChatsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RecentChatsScreen(),
      );
    case BatchesScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BatchesScreen(),
      );
    case NotificationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NotificationScreen(),
      );

    case TeacherRequest.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TeacherRequest(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
