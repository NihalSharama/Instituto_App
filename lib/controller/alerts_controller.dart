import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instituto/features/notifications/services/alerts_services.dart';
import 'package:instituto/models/alerts_models.dart';

class AlertsController extends GetxController {
  final assingClassSubPopupKey = GlobalKey<FormState>();
  var requestToJoin = [].obs;
  var notifications = Rxn<List<NotificationModel>>();

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

  Future<String> featchTacherRequest() async {
    // final teacherRequests = await AlertsServices.getTeacheresRequest();
    // teachersRequestToJoin.value = teacherRequests;

    // api ready ke bd hatadena h
    requestToJoin.value = [
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

    return '';
  }

  featchNotifications() async {
    // final List<NotificationModel> notficationList =
    //     await AlertsServices.getNotfications();

    // notifications.value = notficationList;

    notifications.value = [
      NotificationModel(
          '1',
          'Arjuna 11th Timing 10:00AM - 11:00AM To 4:00PM - 5:00PM',
          'Please Note that timing of your Arjuna batch has been changed from 10:00PM - 11:00AM To 4:00PM - 5:00PM',
          'Arjuna 11th',
          DateTime.parse('2012-02-27 13:27:00')),
      NotificationModel(
          '2',
          'Arjuna 11th Timing 10:00AM - 11:00AM To 4:00PM - 5:00PM',
          'Please Note that timing of your Arjuna batch has been changed from 10:00PM - 11:00AM To 4:00PM - 5:00PM',
          'Arjuna 11th',
          DateTime.parse('2012-02-27 13:27:00')),
      NotificationModel(
          '3',
          'Arjuna 11th Timing 10:00AM - 11:00AM To 4:00PM - 5:00PM',
          'Please Note that timing of your Arjuna batch has been changed from 10:00PM - 11:00AM To 4:00PM - 5:00PM',
          'Arjuna 11th',
          DateTime.parse('2012-02-27 13:27:00')),
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
    // featchTacherRequest();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
