// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/global_variables.dart';

class SettingFormField extends StatelessWidget {
  final String svg;

  final String text;

  const SettingFormField({
    Key? key,
    required this.svg,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          svg,
        ),
        const SizedBox(
          width: 40,
        ),
        Text(
          text,
          style: TextStyle(color: AppColors.backgrundGray),
        ),
        const SizedBox(
          width: 160,
        ),
        SvgPicture.asset("assets/icons/arrow_right.svg")
      ],
    );
  }
}
