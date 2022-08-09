import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/constants/global_variables.dart';

class SignupStep1 extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController mobileController;
  final VoidCallback? onStudentPress;
  final VoidCallback? onTeacherPress;
  final VoidCallback? onOwnerPress;
  final String userRole;

  SignupStep1(
    this.firstNameController,
    this.lastNameController,
    this.mobileController, {
    Key? key,
    required this.userRole,
    required this.onStudentPress,
    required this.onTeacherPress,
    required this.onOwnerPress,
  }) : super(key: key);

  @override
  State<SignupStep1> createState() => _SignupStep1State();
}

class _SignupStep1State extends State<SignupStep1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
            child: Column(
          children: [
            CustomTextField(
              controller: widget.firstNameController,
              hintText: 'First Name',
            ),
            CustomTextField(
                controller: widget.lastNameController, hintText: 'Last Name'),
            CustomTextField(
                controller: widget.mobileController, hintText: 'Mobile No'),
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
              onPressed: widget.onStudentPress,
              text: 'Student',
              width: 100,
              height: 40,
              elevation: 0,
              color: (widget.userRole == 'student'
                  ? AppColors.mainColor
                  : AppColors.backgroundGrayMoreLight),
              textcolor: (widget.userRole == 'student'
                  ? Colors.white
                  : AppColors.descriptionColorExtraLight),
            ),
            CustomButton(
              onPressed: widget.onTeacherPress,
              text: 'Teacher',
              width: 100,
              height: 40,
              elevation: 0,
              color: (widget.userRole == 'teacher'
                  ? AppColors.mainColor
                  : AppColors.backgroundGrayMoreLight),
              textcolor: (widget.userRole == 'teacher'
                  ? Colors.white
                  : AppColors.descriptionColorExtraLight),
            ),
            CustomButton(
              onPressed: widget.onOwnerPress,
              text: 'Owner',
              width: 100,
              height: 40,
              elevation: 0,
              color: (widget.userRole == 'owner'
                  ? AppColors.mainColor
                  : AppColors.backgroundGrayMoreLight),
              textcolor: (widget.userRole == 'owner'
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
