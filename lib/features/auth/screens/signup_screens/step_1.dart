import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/auth_controllers.dart';

class SignupStep1 extends GetView<AuthController> {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
            child: Column(
          children: [
            CustomTextField(
              controller: controller.firstNameController,
              hintText: 'First Name',
            ),
            CustomTextField(
                controller: controller.lastNameController,
                hintText: 'Last Name'),
            CustomTextField(
                controller: controller.mobileController, hintText: 'Mobile No'),
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
