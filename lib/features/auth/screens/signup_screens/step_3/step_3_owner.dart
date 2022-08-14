import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/auth_controllers.dart';

class SignupStep3Owner extends GetView<AuthController> {
  const SignupStep3Owner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
              child: Column(
            children: [
              CustomTextField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Your Institue Code';
                  }
                  return null;
                },
                controller: controller.instituteCodeController,
                hintText: 'Create Institute Code',
              ),
              CustomTextField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter Institute Name';
                  }
                  return null;
                },
                controller: controller.instituteNameController,
                hintText: 'Institute Name',
              ),
              CustomTextField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "enter your about";
                  }
                  return null;
                },
                controller: controller.aboutInstituteController,
                hintText: 'About Your Institute',
                maxLines: 5,
                paddingTop: 15,
              ),
            ],
          )),
          const SizedBox(height: 10),
          const Text(
            'Number Of Students',
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
                onPressed: controller.on500StudentPress,
                text: '0-500',
                width: 100,
                height: 40,
                elevation: 0,
                color: (controller.numberOfStudents.value == '500'
                    ? AppColors.mainColor
                    : AppColors.backgroundGrayMoreLight),
                textcolor: (controller.numberOfStudents.value == '500'
                    ? Colors.white
                    : AppColors.descriptionColorExtraLight),
              ),
              CustomButton(
                onPressed: controller.on1000StudentPress,
                text: '500-1000',
                width: 100,
                height: 40,
                elevation: 0,
                color: (controller.numberOfStudents.value == '1000'
                    ? AppColors.mainColor
                    : AppColors.backgroundGrayMoreLight),
                textcolor: (controller.numberOfStudents.value == '1000'
                    ? Colors.white
                    : AppColors.descriptionColorExtraLight),
              ),
              CustomButton(
                onPressed: controller.on2000StudentPress,
                text: '1000-2000',
                width: 100,
                height: 40,
                elevation: 0,
                color: (controller.numberOfStudents.value == '2000'
                    ? AppColors.mainColor
                    : AppColors.backgroundGrayMoreLight),
                textcolor: (controller.numberOfStudents.value == '2000'
                    ? Colors.white
                    : AppColors.descriptionColorExtraLight),
              )
            ],
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
