import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/features/auth/screens/login_screen.dart';
import 'package:instituto/features/auth/services/auth_service.dart';
import 'package:instituto/features/home/screens/home_screen.dart';
import 'package:instituto/features/landing.dart';
import 'package:instituto/models/user.dart';

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

  var subjects = <String>[].obs;
  var batches = <String>[].obs;

  var user = Rxn<UserModel>();

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

    var featchedUser = await AuthServices.verify_login_otp(
        int.parse(mobileController.text), int.parse(enteredOtp.value));

    if (featchedUser != null) {
      print(featchedUser);
      UserStorage().saveUser({
        'id': featchedUser['id'].toString(),
        'firstname': featchedUser['first_name'],
        'lastname': featchedUser['last_name'],
        'selectedInstitute': (featchedUser['institute_codes'].length == 0
            ? null
            : featchedUser['institute_codes'][0]),
        'institutes': featchedUser['institute_codes'],
        'role': featchedUser['role'],
      });

      Navigator.pushNamed(
          context,
          LandingScreen.routeName +
              HomePage.routeName); // navigate to dashboard
    }
    enteredOtp.value = '';
  }

  featchSubjects(String institute_code) async {
    List<String> featchedSubjects =
        await AuthServices.fetch_subjects_list(institute_code);
    subjects.value = featchedSubjects;
  }

  featchBatches(String institute_code) async {
    List<String> featchedBatches = await AuthServices.fetch_batches_list(
        institute_code,
        subjects,
        Defaults().getGrade(classDropdownValue.value));

    print(featchedBatches);

    batches.value = featchedBatches;
  }

  // basic auth functions
  void onNextStep(formKeys, context) async {
    if (!formKeys[currentStep.value].currentState!.validate()) {
      return;
    }
    // sending otp
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
        Navigator.pushNamed(context, LoginScreen.routeName);
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
    classDropdownValue.value = Defaults().classes.first;
    super.onInit();
  }

  @override
  void onClose() {}
}
