import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/features/notifications/services/alerts_services.dart';
import 'package:instituto/models/alerts_models.dart';

class AlertsController extends GetxController {
  final assingClassSubPopupKey = GlobalKey<FormState>();
  var requestToJoin = [].obs;
  var notifications = Rxn<List<NotificationModel>>();

  var selectedClassesList = <String>[].obs;
  var selectedSubjectList = <String>[].obs;

  Future<String> featchTacherRequest() async {
    final teacherRequests = await AlertsServices.getTeacheresRequest();
    requestToJoin.value = teacherRequests;

    print(requestToJoin.value);

    return '';
  }

  Future<String> featchStudentRequest() async {
    final studentRequests = await AlertsServices.getTeacheresRequest();
    requestToJoin.value = studentRequests;

    print(requestToJoin.value);

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
          'System',
          DateTime.parse('2012-02-27 13:27:00')),
    ];
  }

  onClassSelectionItemChange(List<String> selectedItems) {
    selectedClassesList.value = selectedItems;
  }

  onSubjectSelectionItemChange(List<String> selectedItems) {
    selectedSubjectList.value = selectedItems;
  }

  onAssignSubjects(teacherId, requestId) async {
    final isValid = assingClassSubPopupKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    var grades = <String>[];
    for (var grade in selectedClassesList.value) {
      final index =
          Defaults().classes.indexWhere((element) => element == grade);
      grades.add((index + 1).toString());
    }

    var isNoError = await AlertsServices.assignSubjectsClassesService(
        teacherId, selectedSubjectList.value, grades);

    if (isNoError) {
      requestToJoin.value
          .removeWhere((request) => request['id'].toString() == requestId);
      print(requestToJoin.value);
    }
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
