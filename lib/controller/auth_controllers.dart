import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/features/auth/services/auth_service.dart';

class AuthController extends GetxController {
  var currentStep = 0.obs;
  Rx<String> userRole = 'student'.obs;
  Rx<String> gender = 'male'.obs;
  Rx<String> numberOfStudents = '500'.obs;
  Rx<String> classDropdownValue = 'Class 6th'.obs;
  List<String> selectedSubjectList = <String>[].obs;
  List<String> selectedBatchesList = <String>[].obs;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var mobileController = TextEditingController();
  var instituteNameController = TextEditingController();
  var aboutInstituteController = TextEditingController();
  var instituteCodeController = TextEditingController();
  var fathersNameController = TextEditingController();
  var mothersNameController = TextEditingController();
  var emailController = TextEditingController();
  var aboutYourselfController = TextEditingController();
  var instituteAddressController = TextEditingController();
  var enteredOtp = ''.obs;
  var loginStep = 0.obs;

  var class_dropdown_items = <String>[].obs;
  var subject_dropdown_items = <String>[].obs;
  var batches_dropdown_items = <String>[].obs;

  // auth api functions
  void onRequestLoginOtp(formkey) {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      return;
    }

    RemoteServices.request_login_otp(int.parse(mobileController.text));
    loginStep.value++;
  }

  void onVerifyAndLogin(formkey) {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      return;
    }

    RemoteServices.verify_login_otp(
        int.parse(mobileController.text), int.parse(enteredOtp.value));
  }

  featchDropdownItem() {
    // inko api se mngvana ha singup ke vkt
    class_dropdown_items.value = [
      'Class 6th',
      'Class 7th',
      'Class 8th',
      'Class 9th',
      'Class 10th',
      'Class 11th',
      'Class 12th',
    ];

    subject_dropdown_items.value = [
      'English',
      'Maths',
      'Physics',
      'Chemistry',
      'Economics',
      'Biology',
      'Buisness',
    ];

    batches_dropdown_items.value = [
      'Arjuna 11th maths',
      'Arjuna 11th physics',
      'Arjuna 11th chemistry',
      'Lakshya 12th maths',
      'Lakshya 12th physics',
      'Lakshya 12th chemistry',
    ];
  }

  // basic auth functions
  void onNextStep(formKeys) {
    if (!formKeys[currentStep.value].currentState!.validate()) {
      return;
    }
    if (currentStep.value < 3) {
      currentStep.value++;
    }
    // sending otp
    print(currentStep.value);
    if (currentStep.value == 1) {
      RemoteServices.request_signup_otp(int.parse(mobileController.text),
          firstNameController.text, lastNameController.text);
      // currentStep.value++;
    } else if (currentStep.value == 2) {
      RemoteServices.verify_signup_otp(int.parse(mobileController.text),
          int.parse(enteredOtp.value), userRole.value);
      // currentStep.value++;
    }
  }

  void onPrevStep() {
    currentStep.value == 0 ? null : currentStep.value--;
  }

  void onStudentPress() {
    userRole.value = 'student';
  }

  void onTeacherPress() {
    userRole.value = 'teacher';
  }

  void onOwnerPress() {
    userRole.value = 'owner';
  }

  void on500StudentPress() {
    numberOfStudents.value = '500';
  }

  void on1000StudentPress() {
    numberOfStudents.value = '1000';
  }

  void on2000StudentPress() {
    numberOfStudents.value = '2000';
  }

  void onMalePress() {
    gender.value = 'male';
  }

  void onFemalePress() {
    gender.value = 'female';
  }

  void onOtherPress() {
    gender.value = 'other';
  }

  void onClassDropdownValueChange(String? newVal) {
    classDropdownValue.value = newVal!;
  }

  void onSubjectSelectionItemChange(List<String> selectedItems) {
    selectedSubjectList = selectedItems;
  }

  void onBatchesSelectionItemChange(List<String> selectedItems) {
    selectedBatchesList = selectedItems;
  }

  @override
  void onInit() {
    featchDropdownItem(); // we have to fetch it on 3rd step after user giving institute code
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
