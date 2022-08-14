import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/auth_controllers.dart';

class SignupStep1 extends GetView<AuthController> {
  SignupStep1({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
            child: Column(
          children: [
            CustomTextField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter your First Name';
                }
                return null;
              },
              controller: controller.firstNameController,
              hintText: 'First Name',
            ),
            CustomTextField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Your Last Name';
                  }
                  return null;
                },
                controller: controller.lastNameController,
                hintText: 'Last Name'),
            CustomTextField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Your Moblie Name';
                  }
                  return null;
                },
                controller: controller.mobileController,
                hintText: 'Mobile No'),
          ],
        )),
        const SizedBox(height: 20),
        const Text(
          'Select Who You Are',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.titleColorExtraLight,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 300, bottom: 10, top: 5),
          child: Container(
            height: 2.0,
            color: AppColors.mainColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              onPressed: controller.onStudentPress,
              text: 'Student',
              width: 100,
              height: 40,
              elevation: 0,
              color: (controller.userRole.value == 'student'
                  ? AppColors.mainColor
                  : AppColors.backgroundGrayMoreLight),
              textcolor: (controller.userRole.value == 'student'
                  ? Colors.white
                  : AppColors.descriptionColorExtraLight),
            ),
            CustomButton(
              onPressed: controller.onTeacherPress,
              text: 'Teacher',
              width: 100,
              height: 40,
              elevation: 0,
              color: (controller.userRole.value == 'teacher'
                  ? AppColors.mainColor
                  : AppColors.backgroundGrayMoreLight),
              textcolor: (controller.userRole.value == 'teacher'
                  ? Colors.white
                  : AppColors.descriptionColorExtraLight),
            ),
            CustomButton(
              onPressed: controller.onOwnerPress,
              text: 'Owner',
              width: 100,
              height: 40,
              elevation: 0,
              color: (controller.userRole.value == 'owner'
                  ? AppColors.mainColor
                  : AppColors.backgroundGrayMoreLight),
              textcolor: (controller.userRole.value == 'owner'
                  ? Colors.white
                  : AppColors.descriptionColorExtraLight),
            )
          ],
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
