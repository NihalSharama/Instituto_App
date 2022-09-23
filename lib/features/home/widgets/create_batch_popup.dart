import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_dropdown.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/home_controller.dart';

class CreateBatchePopup extends StatefulWidget {
  const CreateBatchePopup({super.key});

  @override
  State<CreateBatchePopup> createState() => CreateBatchePopupState();
}

class CreateBatchePopupState extends State<CreateBatchePopup> {
  final homeController = Get.put((HomeController()));

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(15),
      content: Stack(
        children: <Widget>[
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const CircleAvatar(
                child: Icon(Icons.close),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Form(
            key: homeController.createBatchPopupKey,
            child: IntrinsicHeight(
              child: Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create Batch',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.titleColorExtraLight,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Container(
                        width: 30,
                        height: 2.8,
                        color: AppColors.mainColor,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                          controller: homeController.batchNameController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Enter Batch Name';
                            } else if (val.length > 10 || val.length > 15) {
                              return 'Too long Batch Name';
                            }
                            return null;
                          },
                          hintText: 'Batch Name',
                          keyboardType: TextInputType.text),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          CustomDropdown(
                              width: 120,
                              items: homeController.class_dropdown_items,
                              dropDownValue:
                                  homeController.classDropdownValue.value,
                              onDropdownSelection:
                                  homeController.onClassDropdownValueChange),
                          SizedBox(
                            width: 30,
                          ),
                          CustomDropdown(
                              width: 115,
                              items: homeController.subject_dropdown_items,
                              dropDownValue:
                                  homeController.subjectDropdownValue.value,
                              onDropdownSelection:
                                  homeController.onSubjectDropdownValueChange),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                            onPressed: homeController.onCreateBatch,
                            text: 'CREATE',
                            width: 100,
                            height: 35,
                          )
                        ],
                      ),
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
