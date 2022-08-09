import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/constants/global_variables.dart';

class SignupStep3Owner extends StatefulWidget {
  final String numberOfStudents;
  final VoidCallback? on500StudentPress;
  final VoidCallback? on1000StudentPress;
  final VoidCallback? on2000StudentPress;
  final TextEditingController instituteNameController;
  final TextEditingController aboutinstituteNameController;

  const SignupStep3Owner(
      {Key? key,
      required this.instituteNameController,
      required this.aboutinstituteNameController,
      required this.numberOfStudents,
      this.on500StudentPress,
      this.on1000StudentPress,
      this.on2000StudentPress})
      : super(key: key);

  @override
  State<SignupStep3Owner> createState() => _SignupStep3OwnerState();
}

class _SignupStep3OwnerState extends State<SignupStep3Owner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
            child: Column(
          children: [
            CustomTextField(
              controller: widget.instituteNameController,
              hintText: 'Institute Name',
            ),
            CustomTextField(
              controller: widget.aboutinstituteNameController,
              hintText: 'About Your Institute',
              maxLines: 5,
              paddingTop: 15,
            ),
          ],
        )),
        const SizedBox(height: 20),
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
              onPressed: widget.on500StudentPress,
              text: '0-500',
              width: 100,
              height: 40,
              elevation: 0,
              color: (widget.numberOfStudents == '500'
                  ? AppColors.mainColor
                  : AppColors.backgroundGrayMoreLight),
              textcolor: (widget.numberOfStudents == '500'
                  ? Colors.white
                  : AppColors.descriptionColorExtraLight),
            ),
            CustomButton(
              onPressed: widget.on1000StudentPress,
              text: '500-1000',
              width: 100,
              height: 40,
              elevation: 0,
              color: (widget.numberOfStudents == '1000'
                  ? AppColors.mainColor
                  : AppColors.backgroundGrayMoreLight),
              textcolor: (widget.numberOfStudents == '1000'
                  ? Colors.white
                  : AppColors.descriptionColorExtraLight),
            ),
            CustomButton(
              onPressed: widget.on2000StudentPress,
              text: '1000-2000',
              width: 100,
              height: 40,
              elevation: 0,
              color: (widget.numberOfStudents == '2000'
                  ? AppColors.mainColor
                  : AppColors.backgroundGrayMoreLight),
              textcolor: (widget.numberOfStudents == '2000'
                  ? Colors.white
                  : AppColors.descriptionColorExtraLight),
            )
          ],
        ),
        const SizedBox(height: 50)
      ],
    );
  }
}
