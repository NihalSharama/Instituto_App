import 'package:flutter/material.dart';
import 'package:instituto/common/widgets/setting_form_field.dart';

import '../../constants/global_variables.dart';
import '../widgets/signInButton.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.4,
          maxChildSize: 0.9,
          minChildSize: 0.32,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: const SettingPage(),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -15,
          child: Container(
            width: 60,
            height: 7,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'PREFRENCES',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.titleColorExtraLight,
              ),
            ),
            const SizedBox(height: 3),
            Container(
              width: 30,
              height: 2.8,
              color: AppColors.mainColor,
            ),
            SettingFormField(svg: "", text: "dark mode"),
            const Text(
              '',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.titleColorExtraLight,
              ),
            ),
            const SizedBox(height: 3),
            Container(
              width: 30,
              height: 2.8,
              color: AppColors.mainColor,
            ),
            SettingFormField(svg: "", text: "dark mode"),
            SettingFormField(svg: "", text: "dark mode"),
            SettingFormField(svg: "", text: "dark mode"),
            SettingFormField(svg: "", text: "dark mode"),
            const Text(
              'CONNECT SYSTEM',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.titleColorExtraLight,
              ),
            ),
            const SizedBox(height: 3),
            Container(
              width: 30,
              height: 2.8,
              color: AppColors.mainColor,
            ),
            SettingFormField(svg: "", text: "dark mode"),
            SettingFormField(svg: "", text: "dark mode"),
            SettingFormField(svg: "", text: "dark mode"),
          ]),
        )
      ],
    );
  }
}
