import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/setting_form_field.dart';

import '../../constants/global_variables.dart';
import '../widgets/signInButton.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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

  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 10,
          child: Container(
            width: 65,
            height: 3,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black38,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 10),
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
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                print("Clicked");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/dark_mode.svg",
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "DARK MODE",
                        style: TextStyle(color: AppColors.backgrundGray),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 160,
                  ),
                  Transform.scale(
                    scale: 0.6,
                    child: CupertinoSwitch(
                      activeColor: AppColors.mainColor,
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 2,
              thickness: 1,
              color: AppColors.backgroundGrayMoreLight,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'CONTROLS',
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
            const SizedBox(
              height: 10,
            ),
            SettingFormField(
              svg: " assets/icons/create_batch.svg",
              text: "CREATE BATCH",
              onTap: () => print('clicked'),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 2,
              thickness: 1,
              color: AppColors.backgroundGrayMoreLight,
            ),
            const SizedBox(
              height: 10,
            ),
            SettingFormField(
              svg: "assets/icons/create_subjects.svg",
              text: "CREATE SUBJECTS",
              onTap: () => print('clicked'),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 2,
              thickness: 1,
              color: AppColors.backgroundGrayMoreLight,
            ),
            const SizedBox(
              height: 10,
            ),
            SettingFormField(
              svg: "assets/icons/join_batch.svg",
              text: "JOIN BATCH",
              onTap: () => print('clicked'),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 2,
              thickness: 1,
              color: AppColors.backgroundGrayMoreLight,
            ),
            const SizedBox(
              height: 10,
            ),
            SettingFormField(
              svg: "assets/icons/join_institute.svg",
              text: "JOIN INSTIIUTE",
              onTap: () => print('clicked'),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 2,
              thickness: 1,
              color: AppColors.backgroundGrayMoreLight,
            ),
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
            const SizedBox(
              height: 10,
            ),
            SettingFormField(
              svg: "assets/icons/need_help.svg",
              text: "NEED HELP?",
              onTap: () => print('clicked'),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 2,
              thickness: 1,
              color: AppColors.backgroundGrayMoreLight,
            ),
            const SizedBox(
              height: 10,
            ),
            SettingFormField(
              svg: "assets/icons/help_support.svg",
              text: "HELP & SUPPORT",
              onTap: () => print('clicked'),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 2,
              thickness: 1,
              color: AppColors.backgroundGrayMoreLight,
            ),
            const SizedBox(
              height: 10,
            ),
            SettingFormField(
              svg: "assets/icons/about.svg",
              text: "ABOUT",
              onTap: () => print('clicked'),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 2,
              thickness: 1,
              color: AppColors.backgroundGrayMoreLight,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButtonRounded(
                onPressed: () => print("clicked"), text: "SIGN OUT"),
          ]),
        )
      ],
    );
  }
}
