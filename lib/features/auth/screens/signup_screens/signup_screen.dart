import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/curve_widgets.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/features/auth/screens/login_screen.dart';
import 'package:instituto/features/auth/screens/signup_screens/step_1.dart';
import 'package:instituto/features/auth/screens/signup_screens/step_2.dart';
import 'package:instituto/features/auth/screens/signup_screens/step_3/step_3_owner.dart';
import 'package:instituto/features/auth/screens/signup_screens/step_3/step_3_student.dart';
import 'package:instituto/features/auth/screens/signup_screens/step_4/step_4_student.dart';
import '/constants/global_variables.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = '/signup';

  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  int currentStep = 0;
  List<String> class_dropdown_items = [
    'Class 6th',
    'Class 7th',
    'Class 8th',
    'Class 9th',
    'Class 10th',
    'Class 11th',
    'Class 12th',
  ];
  List<String> subject_dropdown_items = [
    'English',
    'Maths',
    'Physics',
    'Chemistry',
    'Economics',
    'Biology',
    'Buisness',
  ];
  // step 1
  String userRole = 'student';
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  // step 3 -- owner
  String numberOfStudents = '500';
  TextEditingController instituteNameController = TextEditingController();
  TextEditingController aboutInstituteController = TextEditingController();
  // step 3 -- student
  String classDropdownValue = 'Class 6th';
  Rx<List<String>> selectedSubjectList = Rx<List<String>>([]);
  TextEditingController instituteCodeController = TextEditingController();
  // step 4 -- student
  TextEditingController fathersNameController = TextEditingController();
  TextEditingController mothersNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void onStudentPress() {
    setState(() {
      userRole = 'student';
    });
  }

  void onTeacherPress() {
    setState(() {
      userRole = 'teacher';
    });
  }

  void onOwnerPress() {
    setState(() {
      userRole = 'owner';
    });
  }

  void on500StudentPress() {
    setState(() {
      numberOfStudents = '500';
    });
  }

  void on1000StudentPress() {
    setState(() {
      numberOfStudents = '1000';
    });
  }

  void on2000StudentPress() {
    setState(() {
      numberOfStudents = '2000';
    });
  }

  void onClassDropdownValueChange(String? newVal) {
    setState(() {
      classDropdownValue = newVal!;
    });
  }

  void onSubjectSelectionItemChange(List<String> selectedItems) {
    setState(() {
      selectedSubjectList.value = selectedItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Step> getSteps() => [
          Step(
              isActive: currentStep >= 0,
              title: const Text(''),
              content: SignupStep1(
                firstNameController,
                lastNameController,
                mobileController,
                onStudentPress: onStudentPress,
                onTeacherPress: onTeacherPress,
                onOwnerPress: onOwnerPress,
                userRole: userRole,
              )),
          Step(
              isActive: currentStep >= 1,
              title: const Text(''),
              content: SignupStep2PhoneVerify(
                mobileNumber: mobileController.text,
              )),
          Step(
            isActive: currentStep >= 2,
            title: const Text(''),
            content: (userRole == 'owner'
                ? SignupStep3Owner(
                    numberOfStudents: numberOfStudents,
                    instituteNameController: instituteNameController,
                    aboutinstituteNameController: aboutInstituteController,
                    on500StudentPress: on500StudentPress,
                    on1000StudentPress: on1000StudentPress,
                    on2000StudentPress: on2000StudentPress,
                  )
                : SignupStep3Student(
                    instituteCodeController: instituteCodeController,
                    classDropdownValue: classDropdownValue,
                    onClassDropdownItemChange: onClassDropdownValueChange,
                    onSubjectSlectionItemChange: onSubjectSelectionItemChange,
                    selectedSubjectList: selectedSubjectList,
                    classDropdowItems: class_dropdown_items,
                    subjectDropdownItems: subject_dropdown_items,
                  )),
          ),
          Step(
              isActive: currentStep >= 3,
              title: const Text(''),
              content: SignupStep4Student(
                  fathersNameController: fathersNameController,
                  mothersNameController: mothersNameController,
                  emailController: emailController)),
        ];
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // curve
            const CircualCurve(),

            // Header
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    (() {
                      if (currentStep == 0) {
                        return "Hey there! 👋🏻";
                      } else if (currentStep == 1) {
                        return "Privacy is Priority 🤞";
                      } else if (currentStep == 2) {
                        return "Just one step ahead 😋";
                      } else {
                        return "Lets have it done 😉";
                      }
                    })(),
                    style: const TextStyle(
                        color: AppColors.titleColorExtraLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                        // )
                        ),
                  )
                ],
              ),
            ),

            // Steps Timeline
            Expanded(
              child: Stepper(
                elevation: 0,
                type: StepperType.horizontal,
                steps: getSteps(),
                currentStep: currentStep,
                onStepContinue: () {
                  final lastStep = currentStep == getSteps().length - 1;

                  if (lastStep) {
                    print('finished');
                  }
                  setState(() => currentStep += 1);
                },
                onStepCancel: () {
                  setState(() => currentStep -= 1);
                },
                controlsBuilder: (context, details) => (Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonBordered(
                      onPressed: (details.currentStep == 0
                          ? () {}
                          : details.onStepCancel),
                      text: 'Back',
                      width: 130,
                      height: 40,
                      color: (details.currentStep == 0
                          ? AppColors.descriptionColorLight
                          : AppColors.mainColor),
                    ),
                    CustomButton(
                      onPressed: (details.currentStep == 3
                          ? () {} // function to signup
                          : details.onStepContinue),
                      text: (details.currentStep == 1 ? 'Verify' : 'Next'),
                      width: 130,
                      height: 40,
                    )
                  ],
                )),
              ),
            ),

            // Bottom
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.descriptionColorLight),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, LoginScreen.routeName),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: AppColors.mainColor,
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
