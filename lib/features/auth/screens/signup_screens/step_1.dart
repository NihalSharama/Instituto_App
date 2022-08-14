import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/common/widgets/triple_selection_buttons.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/auth_controllers.dart';

class SignupStep1 extends StatefulWidget {
  const SignupStep1({Key? key}) : super(key: key);

  @override
  State<SignupStep1> createState() => _SignupStep1State();
}

class _SignupStep1State extends State<SignupStep1> {
  final authController = Get.put((AuthController()));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
              key: authController.singupFormKeys[0],
              child: Column(
                children: [
                  CustomTextField(
                    validator: (value) {
                      print('value $value');
                      if (value == null || value.isEmpty) {
                        return 'Enter your First Name';
                      }
                      return null;
                    },
                    controller: authController.firstNameController,
                    hintText: 'First Name',
                  ),
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Your Last Name';
                      }
                      return null;
                    },
                    controller: authController.lastNameController,
                    hintText: 'Last Name',
                  ),
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Your Moblie No.';
                      }
                      return null;
                    },
                    controller: authController.mobileController,
                    hintText: 'Mobile No',
                  ),
                ],
              )),
          SizedBox(height: 20),
          TripleSelectionButtons(
              field: authController.userRole.value,
              firstButtonText: 'Student',
              secondButtonText: 'Teacher',
              thirdButtonText: 'Owner',
              title: 'Select Who You Are',
              onFirstButtonPress: authController.onStudentPress,
              onSecondButtonPress: authController.onTeacherPress,
              onThirdButtonPress: authController.onOwnerPress),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
