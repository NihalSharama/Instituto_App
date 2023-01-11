import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/instituteController.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InstituteStatistics extends StatelessWidget {
  InstituteStatistics({super.key});

  final List<SalesData> chartData = [
    SalesData(DateTime.utc(2018), 35),
    SalesData(DateTime.utc(2019), 28),
    SalesData(DateTime.utc(2020), 34),
    SalesData(DateTime.utc(2021), 32),
    SalesData(DateTime.utc(2022), 40)
  ];

  @override
  Widget build(BuildContext context) {
    final instituteStatisticsController =
        Get.put((InstituteStatisticsController()));

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: FutureBuilder(
                      future: instituteStatisticsController
                          .featchinstituteStatisticsdetails('1'),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        return Column(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "INSTITUTE STATISTICS",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "THIS MONTH",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white30,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          instituteStatisticsController
                                              .instituteStatisticsdetails
                                              .value!
                                              .month,
                                          style: TextStyle(
                                              fontSize: 29,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "THIS MONTH",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white30,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          instituteStatisticsController
                                              .instituteStatisticsdetails
                                              .value!
                                              .target,
                                          style: TextStyle(
                                              fontSize: 29,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        );
                      }),
                ),
              ),
              Expanded(
                  flex: 8,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "EARNINGS",
                              style: TextStyle(fontSize: 10),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "THIS MONTH",
                              style: TextStyle(
                                  fontSize: 10, color: AppColors.mainColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
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
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ENROLMENTS",
                              style: TextStyle(fontSize: 10),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "THIS MONTH",
                              style: TextStyle(
                                  fontSize: 10, color: AppColors.mainColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
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
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "STUDENTS",
                              style: TextStyle(fontSize: 10),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "SUBJECTS",
                              style: TextStyle(
                                  fontSize: 10, color: AppColors.mainColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
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
                      ],
                    ),
                  ))
            ]),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
