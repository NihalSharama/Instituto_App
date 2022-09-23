import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instituto/features/alerts/services/alerts_services.dart';
import 'package:instituto/features/auth/services/auth_service.dart';

class AlertsController extends GetxController {
  final assingClassSubPopupKey = GlobalKey<FormState>();
  var teachersRequestToJoin = [].obs;
  var selectedClassesList = <String>[].obs;
  var selectedSubjectList = <String>[].obs;
  var subjects_dropdown_items = <String>[].obs;
  final class_dropdown_items = [
    // classes from api
    'Class 6th',
    'Class 7th',
    'Class 8th',
    'Class 9th',
    'Class 10th',
    'Class 11th',
    'Class 12th',
  ];

  featchSubjects(String institute_code) async {
    // List<String> subjects =
    //     await AuthServices.fetch_subjects_list(institute_code);
    // subjects_dropdown_items.value = subjects;
    subjects_dropdown_items.value = [
      'English',
      'Science',
      'Maths',
      'SST',
      'Buisness'
    ];
  }

  featchTacherRequest() async {
    // await AlertsServices.getTeacheresRequest();
    // teachersRequestToJoin.value = teacherRequests;

    teachersRequestToJoin.value = [
      {
        'id': 1,
        'name': 'Nihal Sharma',
        'mobile': '+917053904411',
        'subject': 'Physics'
      },
      {
        'id': 2,
        'name': 'Nihal Sharma',
        'mobile': '+917053904411',
        'subject': 'Physics'
      },
      {
        'id': 3,
        'name': 'Nihal Sharma',
        'mobile': '+917053904411',
        'subject': 'Physics'
      },
      {
        'id': 4,
        'name': 'Nihal Sharma',
        'mobile': '+917053904411',
        'subject': 'Physics'
      },
    ];
  }

  onClassSelectionItemChange(List<String> selectedItems) {
    selectedClassesList.value = selectedItems;
  }

  onSubjectSelectionItemChange(List<String> selectedItems) {
    selectedSubjectList.value = selectedItems;
  }

  onAssignSubjects(teacherId) async {
    final isValid = assingClassSubPopupKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    await AlertsServices.assignSubjectsClassesService(
        teacherId, selectedSubjectList.value, selectedClassesList.value);
  }

  @override
  void onInit() {
    featchTacherRequest();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
