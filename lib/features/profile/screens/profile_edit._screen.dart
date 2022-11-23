import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';

import '../../../controller/auth_controllers.dart';

class ProfileEditScreen extends StatelessWidget {
  static const String routeName = 'profile-edit';

  ProfileEditScreen({super.key});
  final authController = Get.put((AuthController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(),
                Expanded(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("FIRST NAME"),
                          CustomTextField(
                              controller: authController.firstNameController,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("FIRST NAME"),
                          CustomTextField(
                              controller: authController.firstNameController,
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
                              keyboardType: TextInputType.name)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
