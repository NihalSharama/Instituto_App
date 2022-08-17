import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/auth_controllers.dart';

class SignupStep3Owner extends StatefulWidget {
  const SignupStep3Owner({Key? key, required this.signupFormKeys})
      : super(key: key);
  final List<GlobalKey<FormState>> signupFormKeys;
  @override
  State<SignupStep3Owner> createState() => _SignupStep3OwnerState();
}

class _SignupStep3OwnerState extends State<SignupStep3Owner> {
  final authController = Get.put((AuthController()));

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
              key: widget.signupFormKeys[2],
              child: Column(
                children: [
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Your Institue Code';
                      }
                      return null;
                    },
                    controller: authController.instituteCodeController,
                    hintText: 'Create Institute Code',
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Institute Name';
                      } else if (value.length <= 2) {
                        return 'Name should contain atleast 3 letter';
                      } else if (value.length > 20) {
                        return 'Name Too long';
                      }
                      return null;
                    },
                    controller: authController.instituteNameController,
                    hintText: 'Institute Name',
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter About Your Institute";
                      } else if (value.length <= 2) {
                        return 'Description Should Atleast Contain 3 Letters';
                      } else if (value.length > 40) {
                        return 'Description should be less then 40 letters';
                      }
                      return null;
                    },
                    controller: authController.aboutInstituteController,
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
                onPressed: authController.on500StudentPress,
                text: '0-500',
                width: 100,
                height: 40,
                elevation: 0,
                color: (authController.numberOfStudents.value == '500'
                    ? AppColors.mainColor
                    : AppColors.backgroundGrayMoreLight),
                textcolor: (authController.numberOfStudents.value == '500'
                    ? Colors.white
                    : AppColors.descriptionColorExtraLight),
              ),
              CustomButton(
                onPressed: authController.on1000StudentPress,
                text: '500-1000',
                width: 100,
                height: 40,
                elevation: 0,
                color: (authController.numberOfStudents.value == '1000'
                    ? AppColors.mainColor
                    : AppColors.backgroundGrayMoreLight),
                textcolor: (authController.numberOfStudents.value == '1000'
                    ? Colors.white
                    : AppColors.descriptionColorExtraLight),
              ),
              CustomButton(
                onPressed: authController.on2000StudentPress,
                text: '1000-2000',
                width: 100,
                height: 40,
                elevation: 0,
                color: (authController.numberOfStudents.value == '2000'
                    ? AppColors.mainColor
                    : AppColors.backgroundGrayMoreLight),
                textcolor: (authController.numberOfStudents.value == '2000'
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
