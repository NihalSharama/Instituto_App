import 'package:flutter/material.dart';
import 'package:instituto/common/widgets/unauthorized_screen.dart';
import 'package:instituto/features/batch/screens/batch_edit.dart';
import 'package:instituto/features/home/screens/batches_slide.dart';
import 'package:instituto/features/notifications/screens/requests_slide.dart';
import 'package:instituto/features/batch/screens/batch_screen.dart';
import 'package:instituto/features/auth/screens/login_screen.dart';
import 'package:instituto/features/auth/screens/signup_screens/signup_screen.dart';
import 'package:instituto/features/landing.dart';

import 'features/profile/screens/profile_edit._screen.dart';

Route<dynamic> genarateRoute(RouteSettings routeSettings) {
  //  NOTE : auth routes, home flow ke routes ko alg alg file me bnakr idhr combine krna ha
  final List<String> path = routeSettings.name!.split('/');

  if (routeSettings.name!.contains(LandingScreen.routeName)) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => LandingScreen(subRoute: path[2]),
    );
  } else if (routeSettings.name!.contains(BatchEdit.routeName)) {
    return PageRouteBuilder(
      settings: routeSettings,
      pageBuilder: (_, __, ___) => BatchEdit(id: path[3]),
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
    case UnAuthorizedScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UnAuthorizedScreen(),
      );

    case ProfileEditScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProfileEditScreen(),
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
