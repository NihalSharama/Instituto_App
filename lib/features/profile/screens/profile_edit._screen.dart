import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/common/widgets/triple_selection_buttons.dart';
import 'package:instituto/constants/global_variables.dart';

import '../../../controller/auth_controllers.dart';

class ProfileEditScreen extends StatelessWidget {
  static const String routeName = 'profile-edit';

  ProfileEditScreen({super.key});
  final authController = Get.put((AuthController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "View",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white),
                          )),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.3),
                                  BlendMode.srcOver),
                              image: AssetImage("assets/images/maths.png")),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "FIRST NAME",
                                  style: TextStyle(
                                      color: AppColors.textfieldLabelColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600),
                                ),
                                CustomTextField2(
                                    controller:
                                        authController.firstNameController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Father Name';
                                      } else if (value.length <= 2) {
                                        return 'Name should contain atleast 3 letter';
                                      } else if (value.length > 20) {
                                        return 'Name Too long';
                                      }
                                      return null;
                                    },
                                    hintText: "FIRST NAME",
                                    keyboardType: TextInputType.name),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "LAST NAME",
                                style: TextStyle(
                                    color: AppColors.textfieldLabelColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600),
                              ),
                              CustomTextField2(
                                  controller: authController.lastNameController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter Father Name';
                                    } else if (value.length <= 2) {
                                      return 'Name should contain atleast 3 letter';
                                    } else if (value.length > 20) {
                                      return 'Name Too long';
                                    }
                                    return null;
                                  },
                                  hintText: "LAST NAME",
                                  keyboardType: TextInputType.name)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ABOUT",
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textfieldLabelColor),
                    ),
                    CustomTextField2(
                        controller: authController.aboutYourselfController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Father Name';
                          } else if (value.length <= 2) {
                            return 'Name should contain atleast 3 letter';
                          } else if (value.length > 20) {
                            return 'Name Too long';
                          }
                          return null;
                        },
                        hintText: "ABOUT",
                        keyboardType: TextInputType.name)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "EMAIL",
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textfieldLabelColor),
                    ),
                    CustomTextField2(
                        controller: authController.emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Father Name';
                          } else if (value.length <= 2) {
                            return 'Name should contain atleast 3 letter';
                          } else if (value.length > 20) {
                            return 'Name Too long';
                          }
                          return null;
                        },
                        hintText: "EMAIL",
                        keyboardType: TextInputType.name)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "FATHER'S NAME",
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textfieldLabelColor),
                    ),
                    CustomTextField2(
                        controller: authController.fathersNameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Father Name';
                          } else if (value.length <= 2) {
                            return 'Name should contain atleast 3 letter';
                          } else if (value.length > 20) {
                            return 'Name Too long';
                          }
                          return null;
                        },
                        hintText: "FATHER'S NAME",
                        keyboardType: TextInputType.name)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MOTHER'S NAME",
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textfieldLabelColor),
                    ),
                    CustomTextField2(
                        controller: authController.mothersNameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Father Name';
                          } else if (value.length <= 2) {
                            return 'Name should contain atleast 3 letter';
                          } else if (value.length > 20) {
                            return 'Name Too long';
                          }
                          return null;
                        },
                        hintText: "${authController.mothersNameController}",
                        keyboardType: TextInputType.name)
                  ],
                ),
                TripleSelectionButtons(
                    field: authController.userRole.value,
                    firstButtonText: 'MALE',
                    secondButtonText: 'FEMALE',
                    thirdButtonText: 'OTHERS',
                    title: 'GENDER',
                    onFirstButtonPress: authController.onStudentPress,
                    onSecondButtonPress: authController.onTeacherPress,
                    onThirdButtonPress: authController.onOwnerPress),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onPressed: () {
                      print("clicked");
                    },
                    text: "SAVE CHANGES")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
