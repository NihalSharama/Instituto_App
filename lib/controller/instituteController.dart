import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:instituto/models/institute%20statisticsModel.dart';

class InstituteStatisticsController extends GetxController {
  var instituteStatisticsdetails = Rxn<InstituteStatisticsModel>();

  featchinstituteStatisticsdetails(String id) {
    instituteStatisticsdetails.value =
        InstituteStatisticsModel(month: "2 Laks", target: "1 Crore");
  }
}
