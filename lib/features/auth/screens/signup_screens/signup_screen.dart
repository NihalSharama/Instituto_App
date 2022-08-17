import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/curve_widgets.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/controller/auth_controllers.dart';
import 'package:instituto/features/auth/screens/login_screen.dart';
import 'package:instituto/features/auth/screens/signup_screens/step_1.dart';
import 'package:instituto/features/auth/screens/signup_screens/step_2.dart';
import 'package:instituto/features/auth/screens/signup_screens/step_3/step_3_owner.dart';
import 'package:instituto/features/auth/screens/signup_screens/step_3/step_3_student.dart';
import 'package:instituto/features/auth/screens/signup_screens/step_3/step_3_teacher.dart';
import 'package:instituto/features/auth/screens/signup_screens/step_4/step_4_owner.dart';
import 'package:instituto/features/auth/screens/signup_screens/step_4/step_4_student.dart';
import 'package:instituto/features/auth/screens/signup_screens/step_4/step_4_teacher.dart';
import '/constants/global_variables.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = '/signup';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final authController = Get.put((AuthController()));
  final List<GlobalKey<FormState>> singupFormKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  @override
  Widget build(BuildContext context) {
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
                Text(
                  (() {
                    if (authController.currentStep.value == 0) {
                      return "Hey there! 👋🏻";
                    } else if (authController.currentStep.value == 1) {
                      return "Privacy is Priority 🤞";
                    } else if (authController.currentStep.value == 2) {
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
            child: Obx(
              () => Stepper(
                elevation: 0,
                type: StepperType.horizontal,
                steps: getSteps(),
                currentStep: authController.currentStep.value,
                onStepContinue: () => authController.onNextStep(singupFormKeys),
                onStepCancel: authController.onPrevStep,
                onStepTapped: (index) {
                  authController.currentStep.value = index;
                },
                controlsBuilder: (context, details) => (Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonBordered(
                      onPressed: details.onStepCancel,
                      text: 'Back',
                      width: 130,
                      height: 40,
                      color: (details.currentStep == 0
                          ? AppColors.descriptionColorLight
                          : AppColors.mainColor),
                    ),
                    if (details.currentStep == 1) ...{
                      CustomButton(
                        onPressed: details.onStepContinue,
                        text: 'Verify',
                        width: 130,
                        height: 40,
                      )
                    } else if (details.currentStep == 3) ...{
                      CustomButton(
                        onPressed: details.onStepContinue,
                        text: 'Finish',
                        width: 130,
                        height: 40,
                      )
                    } else ...{
                      CustomButton(
                        onPressed: details.onStepContinue,
                        text: 'Next',
                        width: 130,
                        height: 40,
                      )
                    }
                  ],
                )),
              ),
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
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        isActive: authController.currentStep.value >= 0,
        state: authController.currentStep.value > 0
            ? StepState.complete
            : StepState.indexed,
        title: const Text(''),
        content: SignupStep1(signupFormKeys: singupFormKeys),
      ),
      Step(
          isActive: authController.currentStep.value >= 1,
          state: authController.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed,
          title: const Text(''),
          content: SignupStep2PhoneVerify(
            signupFormKeys: singupFormKeys,
          )),
      Step(
          isActive: authController.currentStep.value >= 2,
          state: authController.currentStep.value > 2
              ? StepState.complete
              : StepState.indexed,
          title: const Text(''),
          content: Column(
            children: [
              if (authController.userRole.value == 'owner') ...{
                SignupStep3Owner(
                  signupFormKeys: singupFormKeys,
                ),
              } else if (authController.userRole.value == 'teacher') ...{
                SignupStep3Teacher(
                  signupFormKeys: singupFormKeys,
                )
              } else if (authController.userRole.value == 'student') ...{
                SignupStep3Student(
                  signupFormKeys: singupFormKeys,
                )
              }
            ],
          )),
      Step(
          isActive: authController.currentStep.value >= 3,
          state: authController.currentStep.value > 3
              ? StepState.complete
              : StepState.indexed,
          title: const Text(''),
          content: Column(
            children: [
              if (authController.userRole.value == 'owner') ...{
                SignupStep4Owner(
                  signupFormKeys: singupFormKeys,
                )
              } else if (authController.userRole.value == 'student') ...{
                SignupStep4Student(
                  signupFormKeys: singupFormKeys,
                )
              } else if (authController.userRole.value == 'teacher') ...{
                SignupStep4Teacher(
                  signupFormKeys: singupFormKeys,
                )
              }
            ],
          )),
    ];
  }
}
