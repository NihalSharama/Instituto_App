import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instituto/features/alerts/screens/requests_to_join.dart';
import 'package:instituto/features/batches/screens/batches_screen.dart';
import 'package:instituto/features/chats/chats_screen.dart';
import 'package:instituto/features/home/screens/home_screen.dart';
import 'package:instituto/features/alerts/screens/notification_screen.dart';
import 'package:instituto/features/auth/screens/login_screen.dart';
import 'package:instituto/features/auth/screens/signup_screens/signup_screen.dart';

Route<dynamic> genarateRoute(RouteSettings routeSettings) {
  //  NOTE : auth routes, home flow ke routes ko alg alg file me bnakr idhr combine krna ha
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return PageRouteBuilder(
        settings: routeSettings,
        pageBuilder: (_, __, ___) => const LoginScreen(),
      );

    case SignupScreen.routeName:
      return PageRouteBuilder(
        settings: routeSettings,
        pageBuilder: (_, __, ___) => const SignupScreen(),
      );

    case HomePage.routeName:
      return PageRouteBuilder(
        transitionDuration: Duration.zero,
        settings: routeSettings,
        pageBuilder: (_, __, ___) => const HomePage(),
      );
    case RecentChatsScreen.routeName:
      return PageRouteBuilder(
        transitionDuration: Duration.zero,
        settings: routeSettings,
        pageBuilder: (_, __, ___) => const RecentChatsScreen(),
      );
    case BatchesScreen.routeName:
      return PageRouteBuilder(
        transitionDuration: Duration.zero,
        settings: routeSettings,
        pageBuilder: (_, __, ___) => const BatchesScreen(),
      );
    case NotificationScreen.routeName:
      return PageRouteBuilder(
        transitionDuration: Duration.zero,
        settings: routeSettings,
        pageBuilder: (_, __, ___) => const NotificationScreen(),
      );

    case RequestsToJoin.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RequestsToJoin(),
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
