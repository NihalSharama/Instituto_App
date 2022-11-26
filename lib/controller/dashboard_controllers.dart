import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/models/dashboard_model.dart';

class TeacherRankingController extends GetxController {
  var teacherRankingDetails = Rxn<TeacherRankingModel>();

  featchTeacherRankingDetails(String id) {
    teacherRankingDetails.value = TeacherRankingModel(
        teacherName: "ADITYA PASWAN",
        ranking: 4.5,
        salary: 69,
        totalStudent: 400);
  }
}

class StoriesController extends GetxController {
  var storiesDetails = Rxn<StoriesModel>();

  featchStoriesDetails(String id) {
    storiesDetails.value = StoriesModel(images: [
      "assets/images/maths.png",
      "assets/images/chemistry.png",
      "assets/images/physics.png",
    ], name: [
      "NIHAL SHARMA",
      "ANURAG SHAKYA",
      "ADITYA PASWAN"
    ], title: [
      "MATHS",
      "CHEMISTRY",
      "PHYSICS"
    ]);
  }
}
