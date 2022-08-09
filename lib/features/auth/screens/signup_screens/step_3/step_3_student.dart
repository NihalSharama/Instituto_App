import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_dropdown.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:multiselect/multiselect.dart';

class SignupStep3Student extends StatefulWidget {
  final TextEditingController instituteCodeController;
  final String classDropdownValue;
  final Rx<List<String>> selectedSubjectList;
  final Function(String?)? onClassDropdownItemChange;
  final Function(List<String>) onSubjectSlectionItemChange;
  final List<String> classDropdowItems;
  final List<String> subjectDropdownItems;

  const SignupStep3Student({
    Key? key,
    required this.instituteCodeController,
    required this.classDropdownValue,
    required this.onClassDropdownItemChange,
    required this.onSubjectSlectionItemChange,
    required this.selectedSubjectList,
    required this.classDropdowItems,
    required this.subjectDropdownItems,
  }) : super(key: key);

  @override
  State<SignupStep3Student> createState() => _SignupStep3StudentState();
}

class _SignupStep3StudentState extends State<SignupStep3Student> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
            controller: widget.instituteCodeController,
            hintText: 'Institute Code'),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomDropdown(
              items: widget.classDropdowItems,
              dropDownValue: widget.classDropdownValue,
              onDropdownSelection: widget.onClassDropdownItemChange,
            ),
            // DropDownMultiSelect(
            //   whenEmpty: 'Subjects',
            //   options: subject_dropdown_items,
            //   selectedValues: widget.selectedSubjectList.value,
            //   onChanged: widget.onSubjectSlectionItemChange,
            // )
          ],
        )
      ],
    );
  }
}
