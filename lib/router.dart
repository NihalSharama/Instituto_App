import 'package:flutter/material.dart';
import 'package:instituto/features/batch/screens/batch_edit.dart';
import 'package:instituto/features/notifications/screens/requests_slide.dart';
import 'package:instituto/features/batch/screens/batch_screen.dart';
import 'package:instituto/features/auth/screens/login_screen.dart';
import 'package:instituto/features/auth/screens/signup_screens/signup_screen.dart';
import 'package:instituto/features/landing.dart';

Route<dynamic> genarateRoute(RouteSettings routeSettings) {
  //  NOTE : auth routes, home flow ke routes ko alg alg file me bnakr idhr combine krna ha
  final List<String> path = routeSettings.name!.split('/');

  if (routeSettings.name!.contains(LandingScreen.routeName)) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => LandingScreen(subRoute: path[2]),
    );
  } else if (routeSettings.name!.contains(BatchScreen.routeName)) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => BatchScreen(id: path[2]),
    );
  }

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
