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

class SignupScreen extends GetView<AuthController> {
  SignupScreen({Key? key}) : super(key: key);
  static const String routeName = '/signup';
  final authController = Get.put((AuthController()));
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                const SizedBox(height: 5),
                Text(
                  (() {
                    if (controller.currentStep.value == 0) {
                      return "Hey there! 👋🏻";
                    } else if (controller.currentStep.value == 1) {
                      return "Privacy is Priority 🤞";
                    } else if (controller.currentStep.value == 2) {
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
                currentStep: controller.currentStep.value,
                onStepContinue: controller.onNextStep,
                onStepCancel: controller.onPrevStep,
                onStepTapped: (index) {
                  controller.currentStep.value = index;
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
                        // details.onStepContinue,
                        onPressed: () {
                          details.onStepContinue;
                          print('Clicked');
                        },
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
          isActive: controller.currentStep.value >= 0,
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed,
          title: const Text(''),
          content: SignupStep1()),
      Step(
          isActive: controller.currentStep.value >= 1,
          state: controller.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed,
          title: const Text(''),
          content: const SignupStep2PhoneVerify()),
      Step(
          isActive: controller.currentStep.value >= 2,
          state: controller.currentStep.value > 2
              ? StepState.complete
              : StepState.indexed,
          title: const Text(''),
          content: Column(
            children: [
              if (controller.userRole.value == 'owner') ...{
                const SignupStep3Owner(),
              } else if (controller.userRole.value == 'teacher') ...{
                SignupStep3Teacher()
              } else if (controller.userRole.value == 'student') ...{
                SignupStep3Student()
              }
            ],
          )),
      Step(
          isActive: controller.currentStep.value >= 3,
          state: controller.currentStep.value > 3
              ? StepState.complete
              : StepState.indexed,
          title: const Text(''),
          content: Column(
            children: [
              if (controller.userRole.value == 'owner') ...{
                SignupStep4Owner()
              } else if (controller.userRole.value == 'student') ...{
                SignupStep4Student()
              } else if (controller.userRole.value == 'teacher') ...{
                SignupStep4Teacher()
              }
            ],
          )),
    ];
  }
}
