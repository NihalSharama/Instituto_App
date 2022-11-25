import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/profile_controller.dart';
import 'package:instituto/features/profile/screens/profile_edit._screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common/widgets/setting_form_field.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<_ChartData> data = [
    _ChartData('CHN', 12),
    _ChartData('GER', 15),
    _ChartData('RUS', 30),
    _ChartData('BRZ', 6.4),
    _ChartData('IND', 14)
  ];

  List<String> images = [
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
  ];

  final profileController = Get.put((ProfileController()));
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: profileController.featchProfileDetails('1'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/profile.png"),
                          radius: 50,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profileController.profileDetails.value!.name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Institute :",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.titleColorLight),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  profileController
                                      .profileDetails.value!.Institute,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.titleColorLight),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Subjects:',
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.titleColorLight),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  profileController
                                      .profileDetails.value!.subject[0],
                                  style: const TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 2,
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: AppColors.mainColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  profileController
                                      .profileDetails.value!.subject[1],
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 2,
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: AppColors.mainColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  profileController
                                      .profileDetails.value!.subject[2],
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Class :",
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.titleColorLight),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  profileController.profileDetails.value!.Class,
                                  style: const TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => print("Clicked"),
                              child: Text(
                                "Join Another Institute?",
                                style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontSize: 8,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, ProfileEditScreen.routeName),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: AppColors.mainColor)),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "EDIT PROFILE",
                              style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SettingFormField(
                      svg: "assets/icons/chat_media.svg",
                      text: "CHATS AND MEDIA",
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
                      svg: "assets/icons/fees_reciepts.svg",
                      text: "FEES AND RECIEPTS",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 2,
                    ),
                    Text(
                      "DOC BOX",
                      style: TextStyle(
                          color: AppColors.backgrundGray,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: 30,
                      height: 2.8,
                      color: Colors.blue,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: images.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 10.0),
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(images[index]);
                        },
                      ),
                    ),
                    Text(
                      "WEEKLY ATTENDENCE ",
                      style: TextStyle(
                          color: AppColors.backgrundGray,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: 30,
                      height: 2.8,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "EARNINGS",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "THIS MONTH",
                          style: TextStyle(
                              color: AppColors.mainColorlite,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                        SvgPicture.asset("assets/icons/dropdown.svg")
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  spreadRadius: 2)
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: 350,
                        height: 180,
                        child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(
                                minimum: 0, maximum: 40, interval: 10),
                            // tooltipBehavior: _tooltip,
                            series: <ChartSeries<_ChartData, String>>[
                              ColumnSeries<_ChartData, String>(
                                  dataSource: data,
                                  xValueMapper: (_ChartData data, _) => data.x,
                                  yValueMapper: (_ChartData data, _) => data.y,
                                  name: 'Gold',
                                  color: Color.fromRGBO(8, 142, 255, 1))
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
