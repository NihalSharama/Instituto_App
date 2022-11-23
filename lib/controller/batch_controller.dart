import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/features/batch/services/batch_services.dart';
import 'package:instituto/models/batch_models.dart';

class BatchController extends GetxController {
  var batchDetails = Rxn<BatchDetailsModel>();
  var notices = Rxn<List<NoticeModel>>();
  var batches = [].obs;

  final createBatchPopupKey = GlobalKey<FormState>();
  var batchNameController = TextEditingController();
  var batchCOdeController = TextEditingController();

  Rx<String> classDropdownValue = 'Class 6th'.obs;
  Rx<String> subjectDropdownValue = 'PHYSICS'.obs;

  void onClassDropdownValueChange(String? newVal) {
    classDropdownValue.value = newVal!;
  }

  void onSubjectDropdownValueChange(String? newVal) {
    subjectDropdownValue.value = newVal!;
  }

  featchBatchDetails(String id) async {
    batchDetails.value = BatchDetailsModel(id, 'Physics XITH', 'Nihal Sharma',
        '2:30PM - 4:00PM', 'Physics', '  XITH', [
      MessageModel('1', 'Hlo maam 👋', 'nihal'),
      MessageModel('2', 'Maam, pahale anda aya ya murgi... ?', 'nihal'),
      MessageModel('3', 'Yes maam same doubt 😁', 'Johny Chacha'),
      MessageModel('4', 'Yeah moomy please.... 😚', 'Lana Rhoades'),
      MessageModel('5', 'stfu b*tch, maam what is the color of ur buggati? 🧐',
          'Andrew Tate'),
      MessageModel('6', 'seems someone flexing.... 🥱', 'Elon Musk'),
    ], [], []);
  }

  onCreateBatch(institute_code) async {
    if (!createBatchPopupKey.currentState!.validate()) {
      return;
    }

    final index = Defaults()
            .classes
            .indexWhere((element) => element == classDropdownValue.value) +
        1;

    await BatchServices.createBatchService(
        batchNameController.text,
        subjectDropdownValue.value,
        institute_code.toString(),
        index.toString(),
        batchCOdeController.text);
  }

  Future<String> featchBatches() async {
    // featch from api
    var featchedBatches = await BatchServices.getBatches();
    print(featchedBatches);

    // batches.value = teacherRequests;

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

  featchNotices(String id) {
    notices.value = [
      NoticeModel(
          '1',
          'Programming contest (only for students)',
          'Documents are imporant so you have to see  and write the things Documents are imporant so you have to see and write the things, well fuck off',
          'Nihal Sharma',
          DateTime.parse('2012-02-27 13:27:00'),
          'Attachement.txt'),
    ];
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
