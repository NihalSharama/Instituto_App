import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_dropdown.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/auth_controllers.dart';

class SignupStep3Student extends StatefulWidget {
  const SignupStep3Student({Key? key, required this.signupFormKeys})
      : super(key: key);
  final List<GlobalKey<FormState>> signupFormKeys;

  @override
  State<SignupStep3Student> createState() => SignupStep3StudentState();
}

class SignupStep3StudentState extends State<SignupStep3Student> {
  final authController = Get.put((AuthController()));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: widget.signupFormKeys[2],
          child: CustomTextField(
              keyboardType: TextInputType.text,
              onChanged: (val) {
                authController.featchSubjects(val);
                authController.featchBatches(val);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Institute Code ';
                }
                return null;
              },
              controller: authController.instituteCodeController,
              hintText: 'Institute Code'),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomDropdown(
              items: Defaults().classes,
              dropDownValue: authController.classDropdownValue.value,
              onDropdownSelection: authController.onClassDropdownValueChange,
            ),
            CustomSelectionDropdown(
              width: 150,
              hintText: 'Subjects',
              selectionOptions: authController.subjects.value,
              selectedValues: authController.selectedSubjectList,
              onChanged: authController.onSubjectSelectionItemChange,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 50),
          child: CustomSelectionDropdown(
            hintText: 'Select Batches',
            selectionOptions: authController.batches.value,
            selectedValues: authController.selectedBatchesList,
            onChanged: authController.onBatchesSelectionItemChange,
          ),
        ),
      ],
    );
  }
}
