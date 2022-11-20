import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_dropdown.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/auth_controllers.dart';
import 'package:instituto/controller/batch_controller.dart';
import 'package:instituto/controller/home_controller.dart';
import 'package:instituto/controller/user_controller.dart';
import 'package:instituto/features/auth/services/auth_service.dart';

class CreateBatchePopup extends StatefulWidget {
  const CreateBatchePopup({super.key});

  @override
  State<CreateBatchePopup> createState() => CreateBatchePopupState();
}

class CreateBatchePopupState extends State<CreateBatchePopup> {
  final homeController = Get.put((HomeController()));
  final batchController = Get.put((BatchController()));
  final userController = Get.put((UserController()));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthServices.fetch_subjects_list(
            userController.user.value!.selectedInstitute![1]),
        builder: (BuildContext builder, AsyncSnapshot<List<String>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: Text('feacthing subjects...'),
              );
            case ConnectionState.done:
              return AlertDialog(
                contentPadding: EdgeInsets.all(15),
                content: Stack(
                  children: <Widget>[
                    Form(
                      key: batchController.createBatchPopupKey,
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
                                    controller:
                                        batchController.batchNameController,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Enter Batch Name';
                                      } else if (val.length > 10 ||
                                          val.length > 15) {
                                        return 'Too long Batch Name';
                                      }
                                      return null;
                                    },
                                    hintText: 'Batch Name',
                                    keyboardType: TextInputType.text),
                                const SizedBox(height: 10),
                                CustomTextField(
                                    controller:
                                        batchController.batchCOdeController,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Create Batch Code';
                                      } else if (val.length > 10 ||
                                          val.length > 15) {
                                        return 'Too long Batch Code';
                                      }
                                      return null;
                                    },
                                    hintText: 'Batch Code',
                                    keyboardType: TextInputType.text),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    CustomDropdown(
                                        width: 120,
                                        items: Defaults().classes,
                                        dropDownValue: batchController
                                            .classDropdownValue.value,
                                        onDropdownSelection: batchController
                                            .onClassDropdownValueChange),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    CustomDropdown(
                                        width: 115,
                                        items: snapshot.data!,
                                        dropDownValue: batchController
                                            .subjectDropdownValue.value,
                                        onDropdownSelection: batchController
                                            .onSubjectDropdownValueChange),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomButton(
                                      onPressed: () {
                                        batchController.onCreateBatch(
                                            userController.user.value!
                                                .selectedInstitute![0]);

                                        // Navigator.pop(context);
                                      },
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
            default:
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
          }
        });
  }
}
