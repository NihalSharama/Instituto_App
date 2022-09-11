import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:instituto/constants/global_variables.dart';

class CircualCurve extends StatefulWidget {
  const CircualCurve({Key? key}) : super(key: key);

  @override
  State<CircualCurve> createState() => Circual_CurveState();
}

class Circual_CurveState extends State<CircualCurve> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: Image.asset(StaticImages.circularCurve));
  }
}

class AppbarCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Image.asset(StaticImages.appBarCurve));
  }
}
