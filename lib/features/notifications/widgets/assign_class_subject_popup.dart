import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_dropdown.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/alerts_controller.dart';
import 'package:instituto/controller/auth_controllers.dart';
import 'package:instituto/controller/home_controller.dart';
import 'package:instituto/features/auth/services/auth_service.dart';

class AssignClassSubPopup extends StatefulWidget {
  final String name;
  final String mobile;
  final String teacherId;
  const AssignClassSubPopup(
      {super.key,
      required this.name,
      required this.mobile,
      required this.teacherId});

  @override
  State<AssignClassSubPopup> createState() => _AssignClassSubPopupState();
}

class _AssignClassSubPopupState extends State<AssignClassSubPopup> {
  final alertsController = Get.put((AlertsController()));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthServices.fetch_subjects_list(
            '1234'), // owner ka v institute id lena h
        builder: (BuildContext builder, AsyncSnapshot<List<String>> snapshot) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(15),
            content: Stack(
              children: <Widget>[
                Form(
                  key: alertsController.assingClassSubPopupKey,
                  child: IntrinsicHeight(
                    child: Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Assign Subjects & Classes',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.titleColorExtraLight,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              width: 130,
                              height: 2.8,
                              color: AppColors.mainColor,
                            ),
                            const SizedBox(height: 15),
                            Row(children: [
                              const Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  minRadius: 30,
                                  maxRadius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/images/dummy_image.png'),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.name,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.titleColor),
                                  ),
                                  Text(
                                    widget.mobile,
                                    style: const TextStyle(
                                        color: AppColors.mainColor,
                                        decoration: TextDecoration.underline,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
                            ]),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                CustomSelectionDropdown(
                                  width: 130,
                                  hintText: 'Classes',
                                  selectionOptions: Defaults().classes,
                                  selectedValues: alertsController
                                      .selectedClassesList.value,
                                  onChanged: alertsController
                                      .onClassSelectionItemChange,
                                ),
                                const SizedBox(width: 20),
                                CustomSelectionDropdown(
                                  width: 130,
                                  hintText: 'Subjects',
                                  selectionOptions: ['Maths', 'Physics'],
                                  selectedValues: alertsController
                                      .selectedSubjectList.value,
                                  onChanged: alertsController
                                      .onSubjectSelectionItemChange,
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomButtonBordered(
                                  text: 'CANCEL',
                                  onPressed: () => Navigator.pop(context),
                                  width: 100,
                                  height: 35,
                                ),
                                const SizedBox(width: 10),
                                CustomButton(
                                  onPressed: () =>
                                      alertsController.onAssignSubjects('16'),
                                  text: 'DONE',
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
        });
  }
}
