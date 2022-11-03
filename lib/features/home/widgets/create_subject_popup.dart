import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/home_controller.dart';

class CreateSubjectPopup extends StatefulWidget {
  const CreateSubjectPopup({super.key});

  @override
  State<CreateSubjectPopup> createState() => CreateSubjectPopupState();
}

class CreateSubjectPopupState extends State<CreateSubjectPopup> {
  final homeController = Get.put((HomeController()));
  var subjectList = <SubjectChipModel>[]; // To Store added chips.
  TextEditingController chipTextController = TextEditingController();

  void _deleteChip(String id) {
    setState(() {
      subjectList.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(15),
      scrollable: true,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Institute Subjects',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.titleColorExtraLight,
            ),
          ),
          const SizedBox(height: 3),
          Container(
            width: 30,
            height: 2,
            color: AppColors.mainColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: chipTextController,
                  validator: (value) {
                    print('value $value');
                    if (value == null || value.isEmpty) {
                      return 'Enter Subject';
                    } else if (value.length > 10) {
                      return 'Subject too long';
                    }
                    return null;
                  },
                  hintText: 'Enter Subject',
                  keyboardType: TextInputType.text,
                  fillColor: AppColors.backgroundGrayExtraLight,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      subjectList.add(SubjectChipModel(
                        DateTime.now().toString(),
                        chipTextController.text.toUpperCase(),
                      ));
                    });
                    chipTextController.text = '';
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          Wrap(
            spacing: 10,
            children: subjectList
                .map((chip) => Chip(
                      label: Text(chip.name),
                      backgroundColor: AppColors.backgroundGrayLight,

                      onDeleted: () => _deleteChip(chip
                          .id), // call delete function by passing click chip id
                    ))
                .toList(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CustomButton(
                onPressed: () {
                  homeController.onCreateSubjects(
                    subjectList,
                  );

                  Navigator.pop(context);
                },
                text: 'CREATE',
                width: 100,
                height: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
