import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_button.dart';

import 'package:instituto/features/profile/screens/profile_edit._screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants/global_variables.dart';
import '../../../controller/profile_controller.dart';

class TeacherProfilePage extends StatelessWidget {
  TeacherProfilePage({Key? key}) : super(key: key);

  final List<SalesData> chartData = [
    SalesData(DateTime.utc(2018), 35),
    SalesData(DateTime.utc(2019), 28),
    SalesData(DateTime.utc(2020), 34),
    SalesData(DateTime.utc(2021), 32),
    SalesData(DateTime.utc(2022), 40)
  ];
  final profileController = Get.put((ProfileController()));

  final teacherProfileController = Get.put((TeacherProfileController()));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: teacherProfileController.featchTeacherProfileDetails('1'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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
                              teacherProfileController
                                  .teacherprofileDetails.value!.name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "INSTITUTE :",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.titleColorLight),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  teacherProfileController
                                      .teacherprofileDetails.value!.Institute,
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
                                  'SUBJECTS:',
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.titleColorLight),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  teacherProfileController
                                      .teacherprofileDetails.value!.subject[0],
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
                                  teacherProfileController
                                      .teacherprofileDetails.value!.subject[1],
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
                                  teacherProfileController
                                      .teacherprofileDetails.value!.subject[2],
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
                                  "CLASSES :",
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.titleColorLight),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  teacherProfileController
                                      .teacherprofileDetails.value!.Class[0],
                                  style: const TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  teacherProfileController
                                      .teacherprofileDetails.value!.Class[1],
                                  style: const TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        onPressed: () {
                          print("clicked");
                        },
                        text: "START MESSAGE"),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 300,
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 2,
                                blurRadius: 10)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: SfCartesianChart(
                          primaryXAxis: DateTimeAxis(),
                          series: <ChartSeries>[
                            // Renders line chart
                            LineSeries<SalesData, DateTime>(
                                dataSource: chartData,
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales)
                          ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 300,
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 2,
                                blurRadius: 10)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: SfCartesianChart(
                          primaryXAxis: DateTimeAxis(),
                          series: <ChartSeries>[
                            // Renders line chart
                            LineSeries<SalesData, DateTime>(
                                dataSource: chartData,
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales)
                          ]),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
