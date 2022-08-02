// landing page for authentication
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:instituto/constants/global_variables.dart';

class AuthLanding extends StatefulWidget {
  static const String routeName = 'auth-landing';
  const AuthLanding({Key? key}) : super(key: key);

  @override
  State<AuthLanding> createState() => _AuthLandingState();
}

class _AuthLandingState extends State<AuthLanding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Align(
          alignment: Alignment.topLeft,
          child: Image.asset(StaticImages.circularCurve)),
    ]));
  }
}
