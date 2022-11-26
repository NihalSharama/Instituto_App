// all global variables for colors with be here

import 'package:flutter/material.dart';

class AppColors {
  // COLORS
  static const mainColor = Color.fromRGBO(35, 127, 213, 1);
  static const mainColorlite = Color.fromARGB(175, 35, 127, 213);

  static const backgroundColor = Colors.white;
  static const titleColor = Color.fromRGBO(54, 54, 54, 1);
  static const titleColorLight = Color.fromRGBO(71, 71, 71, 1);
  static const titleColorExtraLight = Color.fromARGB(255, 104, 104, 104);
  static const descriptionColor = Color.fromRGBO(70, 70, 70, 1);
  static const descriptionColorLight = Color.fromRGBO(126, 126, 126, 1);
  static const descriptionColorExtraLight = Color.fromARGB(255, 179, 179, 179);
  static const descriptionColorDark = Color.fromRGBO(94, 94, 94, 1);
  static const curveColor = Color.fromRGBO(35, 127, 213, 1);
  static const curveColorlight = Color.fromRGBO(35, 127, 213, 0.5);
  static const backgrundGray = Color.fromRGBO(123, 123, 123, 1);
  static const backgroundGrayExtraLight = Color.fromARGB(103, 204, 204, 204);
  static const backgroundGrayLight = Color.fromRGBO(204, 204, 204, 1);
  static const backgroundGrayMoreLight = Color.fromARGB(255, 221, 221, 221);
  static const backgroundGrayDark = Color.fromRGBO(171, 171, 171, 1);
  static const textColor = Color.fromRGBO(119, 119, 119, 1);
  static const maintextColor = Color.fromRGBO(78, 78, 78, 1);
  static const textfieldNameColor = Color.fromRGBO(89, 89, 89, 1);
  static const textfieldBorderColor = Color.fromRGBO(192, 192, 192, 1);
  static const textfieldFillColor = Color.fromRGBO(243, 243, 243, 1);
  static const textfieldLabelColor = Color.fromRGBO(84, 84, 84, 1);
  static const storyViewButtonColor = Color.fromRGBO(116, 116, 116, 68);
}

class StaticImages {
  // STATIC IMAGES
  static const appBarCurve = 'assets/images/appbar_curve.png';
  static const circularCurve = 'assets/images/circular_curve.png';
}

class Defaults {
  final classes = [
    'Class 1st',
    'Class 2nd',
    'Class 3rd',
    'Class 4th',
    'Class 5th',
    'Class 6th',
    'Class 7th',
    'Class 8th',
    'Class 9th',
    'Class 10th',
    'Class 11th',
    'Class 12th',
  ];

  getGrade(classVal) {
    final grade = classes.indexWhere((element) => element == classVal) + 1;
    return grade.toString();
  }
}
