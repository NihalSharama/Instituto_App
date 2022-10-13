import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/features/home/services/home_services.dart';

class HomeController extends GetxController {
  final createBatchPopupKey = GlobalKey<FormState>();
  var batchNameController = TextEditingController();

  Rx<String> classDropdownValue = 'Class 6th'.obs;
  Rx<String> subjectDropdownValue = 'English'.obs;

  var batches = [].obs;

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

  onCreateBatch() async {
    final isValid = createBatchPopupKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    final token = await getToken();
    print(token);
  }

  Future<String> featchBatches() async {
    // featch from api
    // final teacherRequests = await HomeServices.getBatches();
    // batches.value = teacherRequests;

    // bdme api ready hone ke bd hata dena h
    batches.value = [
      {
        'id': '1',
        'batch_name': 'physics XIth',
        'teacher_name': 'Nihal Sharma',
        'timing': '2:30PM - 4:00PM',
        'subject': 'Physics'
      },
      {
        'id': '2',
        'batch_name': 'chemistry XIth',
        'teacher_name': 'Nihal Sharma',
        'timing': '2:30PM - 4:00PM',
        'subject': 'Physics'
      },
      {
        'id': '3',
        'batch_name': 'maths XIth',
        'teacher_name': 'Nihal Sharma',
        'timing': '2:30PM - 4:00PM',
        'subject': 'Physics'
      },
      {
        'id': '4',
        'batch_name': 'politics XIth',
        'teacher_name': 'Nihal Sharma',
        'timing': '2:30PM - 4:00PM',
        'subject': 'Physics'
      },
    ];

    return '';
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
