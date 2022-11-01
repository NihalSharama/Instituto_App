import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/features/home/services/home_services.dart';

class SubjectChipModel {
  late String id;
  late String name;

  SubjectChipModel(this.id, this.name);
}

class HomeController extends GetxController {
  Rx<String> classDropdownValue = 'Class 6th'.obs;
  Rx<String> subjectDropdownValue = 'English'.obs;

  var class_dropdown_items = [
    // classes from api
    'Class 6th',
    'Class 7th',
    'Class 8th',
    'Class 9th',
    'Class 10th',
    'Class 11th',
    'Class 12th',
  ];
  var subject_dropdown_items = <String>[].obs;

  featchSubjectsList() {
    // api se fecth krna ha
    subject_dropdown_items.value = [
      'English',
      'Science',
      'Maths',
      'SST',
      'Buisness'
    ];
  }

  onCreateSubjects(List<SubjectChipModel> subjects, String user) async {
    subjects.forEach((SubjectChipModel subject) async {
      await HomeServices.createSubject(subject.name, user);
    });
  }

  void onClassDropdownValueChange(String? newVal) {
    classDropdownValue.value = newVal!;
  }

  void onSubjectDropdownValueChange(String? newVal) {
    classDropdownValue.value = newVal!;
  }

  @override
  void onInit() {
    featchSubjectsList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
