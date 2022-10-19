import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/features/home/screens/home_screen.dart';
import 'package:instituto/features/auth/services/auth_service.dart';
import 'package:instituto/features/landing.dart';

class AuthController extends GetxController {
  var currentStep = 0.obs;
  var isAuthenticated = true;
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
  void onRequestLoginOtp(formkey) async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      return;
    }

    bool isNoError =
        await AuthServices.request_login_otp(int.parse(mobileController.text));

    if (isNoError) loginStep.value++;
  }

  void onVerifyAndLogin(formkey, context) async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      return;
    }

    bool isNoError = await AuthServices.verify_login_otp(
        int.parse(mobileController.text), int.parse(enteredOtp.value));

    if (isNoError) {
      isAuthenticated = true;
      Navigator.pushNamed(
          context, LandingScreen.routeName); // navigate to dashboard
    }
  }

  featchDropdownItems(String institute_code) async {
    List<String> subjects =
        await AuthServices.fetch_subjects_list(institute_code);
    subject_dropdown_items.value = subjects;

    class_dropdown_items.value = [
      // classes from api
      'Class 6th',
      'Class 7th',
      'Class 8th',
      'Class 9th',
      'Class 10th',
      'Class 11th',
      'Class 12th',
    ];
    classDropdownValue.value = class_dropdown_items.first;

    List<String> batches = await AuthServices.fetch_batches_list(
        institute_code, subjects, classDropdownValue.value);
    batches_dropdown_items.value =
        batches; // filter batches according to selected subjects
  }

  featchDeafaultClasses() async {
    class_dropdown_items.value = [
      // default classes
      'Class 6th',
      'Class 7th',
      'Class 8th',
      'Class 9th',
      'Class 10th',
      'Class 11th',
      'Class 12th',
    ];
  }

  // basic auth functions
  void onNextStep(formKeys, context) async {
    if (!formKeys[currentStep.value].currentState!.validate()) {
      return;
    }
    // sending otp
    print(currentStep.value);
    if (currentStep.value == 0) {
      bool isError = await AuthServices.request_signup_otp(
          int.parse(mobileController.text),
          firstNameController.text,
          lastNameController.text);
      if (isError) currentStep.value++;
    } else if (currentStep.value == 1) {
      bool isError = await AuthServices.verify_signup_otp(
          int.parse(mobileController.text),
          int.parse(enteredOtp.value),
          userRole.value);

      if (isError) currentStep.value++;
    } else if (currentStep.value == 2) {
      currentStep.value++;
    } else if (currentStep.value == 3) {
      bool isNoError = false;
      if (userRole.value == 'student') {
        isNoError = await AuthServices.student_step3_4_endpoint(
            instituteCodeController.text,
            selectedBatchesList,
            fathersNameController.text,
            mothersNameController.text,
            gender.value);
      } else if (userRole.value == 'teacher') {
        isNoError = await AuthServices.teacher_step3_4_endpoint(
            instituteCodeController.text,
            aboutYourselfController.text,
            emailController.text,
            gender.value);
      } else if (userRole.value == 'owner') {
        isNoError = await AuthServices.owner_step3_4_endpoint(
            instituteCodeController.text,
            instituteNameController.text,
            aboutInstituteController.text,
            numberOfStudents.value,
            emailController.text,
            aboutYourselfController.text,
            gender.value,
            instituteAddressController.text);
      }

      if (isNoError) {
        isAuthenticated = true;
        Navigator.pushNamed(context, LandingScreen.routeName);
      }
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
    featchDeafaultClasses();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
