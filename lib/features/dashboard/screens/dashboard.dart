import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instituto/common/widgets/recent_chat_widget.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/chats_controllers.dart';
import 'package:instituto/controller/dashboard_controllers.dart';
import 'package:instituto/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
                              Text(
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
                              Text(
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
                              Text(
                                "NOTE",
                                style: TextStyle(fontSize: 6.5),
                              )
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          CardScrollWidget(currentPage),
                          Positioned.fill(
                              child: PageView.builder(
                                  itemCount: images.length,
                                  reverse: true,
                                  controller: controller,
                                  itemBuilder: (context, index) {
                                    return Container();
                                  }))
                        ],
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
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => print("Stories clicked"),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/chemistry.png")),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  teacherRankingController
                                      .teacherRankingDetails.value!.teacherName,
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      teacherRankingController
                                          .teacherRankingDetails.value!.ranking
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 6,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SvgPicture.asset("assets/icons/star.svg"),
                                    SvgPicture.asset("assets/icons/star.svg"),
                                    SvgPicture.asset("assets/icons/star.svg"),
                                    SvgPicture.asset("assets/icons/star.svg"),
                                    SvgPicture.asset(
                                        "assets/icons/half_star.svg"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "STUDENTS",
                                      style: TextStyle(
                                          fontSize: 6,
                                          color: AppColors.mainColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      teacherRankingController
                                          .teacherRankingDetails
                                          .value!
                                          .totalStudent
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 6,
                                          color: AppColors.mainColorlite,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "SALARY",
                                      style: TextStyle(
                                          fontSize: 6,
                                          color: AppColors.mainColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      teacherRankingController
                                          .teacherRankingDetails.value!.salary
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 6,
                                          color: AppColors.mainColorlite,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ]),
                        ],
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
                        children: [
                          Text(
                            "REVENUE MADE THIS MONTH",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
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
                          decoration: BoxDecoration(
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
                        children: [
                          Text(
                            "FEES LEFT THIS MONTH",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
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
                        child: Text(
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

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;
  CardScrollWidget(this.currentPage);
  final storiesController = Get.put((StoriesController()));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storiesController.featchStoriesDetails('1'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Container(
            width: 400,
            height: 300,
            child: AspectRatio(
              aspectRatio: WidgetAspectRatio,
              child: LayoutBuilder(builder: (context, contraints) {
                var width = contraints.maxWidth;
                var height = contraints.maxHeight;
                var safeWidth = width - 2 * padding;
                var safeHeight = height - 2 * padding;

                var heightOfPrimaryCard = safeHeight;
                var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;
                var primaryCardLeft = safeWidth - widthOfPrimaryCard;
                var horizontalInset = primaryCardLeft / 2;
                List<Widget> cardList = [];

                for (var i = 0; i < images.length; i++) {
                  var delta = i - currentPage;
                  bool isOnRight = delta > 0;

                  var start = padding +
                      max(
                          primaryCardLeft -
                              horizontalInset * -delta * (isOnRight ? 15 : 1),
                          0.0);
                  var CardItem = Positioned.directional(
                    top: padding + verticalInset * max(-delta, 0.0),
                    bottom: padding + verticalInset * max(-delta, 0.0),
                    start: start,
                    textDirection: TextDirection.rtl,
                    child: Container(
                        child: AspectRatio(
                      aspectRatio: cardAspectRatio,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Image.asset(
                          //   images[i],
                          //   fit: BoxFit.cover,
                          // ),
                          GestureDetector(
                            onTap: () => print("Stories Clicked"),
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.5),
                                          BlendMode.srcOver),
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        storiesController
                                            .storiesDetails.value!.images[i]
                                            .toString(),
                                      ))),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  storiesController
                                      .storiesDetails.value!.title[i]
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  storiesController
                                      .storiesDetails.value!.name[i]
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 15,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: AppColors.storyViewButtonColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "VIEW",
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 6,
                                            fontWeight: FontWeight.w600),
                                      )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                  );
                  cardList.add(CardItem);
                }
                return Stack(
                  children: cardList,
                );
              }),
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
