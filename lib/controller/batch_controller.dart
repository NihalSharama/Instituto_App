import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/features/batch/services/batch_services.dart';
import 'package:instituto/models/batch_models.dart';

class BatchController extends GetxController {
  var batchDetails = Rxn<SelectedBatchDetailsModel>();
  final createBatchPopupKey = GlobalKey<FormState>();
  var batchNameController = TextEditingController();
  var batchCOdeController = TextEditingController();
  var msgInputController = TextEditingController();

  Rx<String> classDropdownValue = 'Class 6th'.obs;
  Rx<String> subjectDropdownValue = 'PHYSICS'.obs;

  void onClassDropdownValueChange(String? newVal) {
    classDropdownValue.value = newVal!;
  }

  void onSubjectDropdownValueChange(String? newVal) {
    subjectDropdownValue.value = newVal!;
  }

  featchBatchDetails(String id) async {
    var featchedDetails = await BatchServices.getBatchDetails(id);

    print(featchedDetails);
    batchDetails.value = featchedDetails;
  }

  onCreateBatch(institute_code) async {
    if (!createBatchPopupKey.currentState!.validate()) {
      return;
    }

    await BatchServices.createBatchService(
        batchNameController.text,
        subjectDropdownValue.value,
        institute_code.toString(),
        Defaults().getGrade(classDropdownValue.value),
        batchCOdeController.text);
  }

  onMessageSend(batchId) async {}

  receiveRealtimeChat(batchId) async {}

  messageListener(message) {
    final messageParsed =
        MessageModel(message['id'], message['text'], message['from']);

    batchDetails.value!.messages.add(messageParsed);
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
