import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instituto/common/widgets/recent_chat_widget.dart';
import 'package:instituto/common/widgets/teachers_racking.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/chats_controllers.dart';
import 'package:instituto/controller/dashboard_controllers.dart';
import 'package:instituto/data.dart';
import 'package:instituto/features/notifications/widgets/teacher_request.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common/widgets/card_scroll_sidget.dart';
import '../../../controller/profile_controller.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = 'dashboard';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

final List<SalesData> chartData = [
  SalesData(DateTime.utc(2018), 35),
  SalesData(DateTime.utc(2019), 28),
  SalesData(DateTime.utc(2020), 34),
  SalesData(DateTime.utc(2021), 32),
  SalesData(DateTime.utc(2022), 40)
];
var cardAspectRatio = 12.0 / 16.0;
var WidgetAspectRatio = cardAspectRatio * 1.2;

class _DashboardScreenState extends State<DashboardScreen> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);

    controller.addListener(() {
      setState(() {
        currentPage = controller.page as double;
      });
    });
    final teacherRankingController = Get.put((TeacherRankingController()));
    final chatScreenShowController = Get.put((ChatScreenShowController()));
    final storiesController = Get.put((StoriesController()));

    return FutureBuilder(
        future: teacherRankingController.featchTeacherRankingDetails('1'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'STORIES',
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/add.svg",
                                height: 21,
                                width: 21,
                                fit: BoxFit.scaleDown,
                              ),
                              const Text(
                                "STORY",
                                style: TextStyle(fontSize: 6.5),
                              )
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/document.svg",
                                height: 21,
                                width: 21,
                                fit: BoxFit.scaleDown,
                              ),
                              const Text(
                                "DOCUMENT",
                                style: TextStyle(fontSize: 6.5),
                              )
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/note.svg",
                                height: 21,
                                width: 21,
                                fit: BoxFit.scaleDown,
                              ),
                              const Text(
                                "NOTE",
                                style: TextStyle(fontSize: 6.5),
                              )
                            ],
                          ),
                        ],
                      ),
                      FutureBuilder(
                        future: storiesController.featchStoriesDetails('1'),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          return Stack(
                            children: <Widget>[
                              CardScrollWidget(currentPage),
                              Positioned.fill(
                                  child: PageView.builder(
                                      itemCount: storiesController
                                          .storiesDetails.value!.images.length,
                                      reverse: true,
                                      controller: controller,
                                      itemBuilder: (context, index) {
                                        return Container();
                                      }))
                            ],
                          );
                        },
                      ),
                      const Text(
                        'RECENT CHATS',
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FutureBuilder(
                            future: chatScreenShowController
                                .featchChatScreenShowDetails('1'),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              return RecentChatWidget(
                                  name: chatScreenShowController
                                      .chatScreenShowDetails.value!.name,
                                  image: chatScreenShowController
                                      .chatScreenShowDetails.value!.image,
                                  batch: chatScreenShowController
                                      .chatScreenShowDetails.value!.batch,
                                  topic: chatScreenShowController
                                      .chatScreenShowDetails.value!.topic,
                                  description: chatScreenShowController
                                      .chatScreenShowDetails
                                      .value!
                                      .description);
                            }),
                      ),
                      const Text(
                        'TEACHERS RANKING',
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
                      const SizedBox(height: 10),
                      TeachersRacking(
                        name: teacherRankingController
                            .teacherRankingDetails.value!.teacherName
                            .toString(),
                        mobile: teacherRankingController
                            .teacherRankingDetails.value!.teacherName
                            .toString(),
                        ranking: teacherRankingController
                            .teacherRankingDetails.value!.ranking
                            .toString(),
                        totalStudent: teacherRankingController
                            .teacherRankingDetails.value!.totalStudent
                            .toString(),
                        slaray: teacherRankingController
                            .teacherRankingDetails.value!.salary
                            .toString(),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'STATS GLANCE ',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "REVENUE MADE THIS MONTH",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "69Cr",
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.mainColorlite,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300,
                          height: 180,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 2,
                                    blurRadius: 10)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "FEES LEFT THIS MONTH",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "167 FEES",
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.mainColorlite,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () => print("Clicked"),
                        child: const Text(
                          "ABUSE THOSE BITCHES ?",
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 8,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
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
