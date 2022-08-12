import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_dropdown.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/auth_controllers.dart';
import 'package:multiselect/multiselect.dart';

class SignupStep3Student extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
            controller: controller.instituteCodeController,
            hintText: 'Institute Code'),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomDropdown(
              items: controller.class_dropdown_items,
              dropDownValue: controller.classDropdownValue.value,
              onDropdownSelection: controller.onClassDropdownValueChange,
            ),
            CustomSelectionDropdown(
              width: 150,
              hintText: 'Subjects',
              selectionOptions: controller.subject_dropdown_items,
              selectedValues: controller.selectedBatchesList,
              onChanged: controller.onSubjectSelectionItemChange,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 50),
          child: CustomSelectionDropdown(
            hintText: 'Select Batches',
            selectionOptions: controller.batches_dropdown_items,
            selectedValues: controller.selectedBatchesList,
            onChanged: controller.onBatchesSelectionItemChange,
          ),
        ),
      ],
    );
  }
}
