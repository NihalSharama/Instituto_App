import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_dropdown.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/controller/alerts_controller.dart';
import 'package:instituto/controller/batch_controller.dart';
import 'package:instituto/features/batch/screens/batch_screen.dart';
import 'package:instituto/features/notifications/widgets/batch_student.dart';

import '../../../constants/global_variables.dart';
import '../../../controller/auth_controllers.dart';

class BatchEdit extends StatefulWidget {
  final String id;
  static const String routeName = '/batch/edit/';

  const BatchEdit({Key? key, required this.id}) : super(key: key);

  @override
  State<BatchEdit> createState() => _BatchEditState();
}

class _BatchEditState extends State<BatchEdit> {
  final authController = Get.put((AuthController()));
  final batchController = Get.put((BatchController()));
  final alertsController = Get.put((AlertsController()));

  @override
  Widget build(BuildContext context) {
    print(batchController.batchDetails.value);
    return FutureBuilder(
      future: batchController.featchBatchDetails(widget.id),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context,
                                      BatchScreen.routeName + widget.id);
                                },
                                child: const Icon(
                                  Icons.keyboard_arrow_left,
                                  color: AppColors.mainColor,
                                  size: 40,
                                )),
                            GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/NavToogle.svg',
                                  color: AppColors.mainColor,
                                )),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 105,
                                  height: 110,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/batch_edit.png"))),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  batchController.batchDetails.value!.batchName,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Teacher :",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      batchController
                                          .batchDetails.value!.teacherName,
                                      style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Timing:",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        batchController
                                            .batchDetails.value!.timing,
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Batch Name",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            CustomTextField(
                              controller: authController.firstNameController,
                              validator: (value) {
                                print('value $value');
                                if (value == null || value.isEmpty) {
                                  return 'Enter your First Name';
                                } else if (value.length <= 2) {
                                  return 'Name should contain atleast 3 letter';
                                } else if (value.length <= 2) {
                                  return 'Name Too long';
                                }
                              },
                              hintText: batchController.batchDetails.value!
                                  .batchName, // batchController.batchDetails.value.batchName
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "CLASS",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    CustomDropdown(
                                      items: Defaults().classes,
                                      dropDownValue: authController
                                          .classDropdownValue.value,
                                      onDropdownSelection: authController
                                          .onClassDropdownValueChange,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      batchController
                                          .batchDetails.value!.subject,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    CustomDropdown(
                                      items: authController.subjects,
                                      dropDownValue: authController
                                          .classDropdownValue.value,
                                      onDropdownSelection: authController
                                          .onClassDropdownValueChange,
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Students",
                                  style: TextStyle(
                                      color: AppColors.titleColorExtraLight,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                FutureBuilder(
                                    future:
                                        alertsController.featchTacherRequest(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<String> snapshot) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.waiting:
                                          return const Center(
                                              child: Text(
                                                  'Featching Teacher Requests...'));
                                        case ConnectionState.done:
                                          return (alertsController.requestToJoin
                                                  .value.isNotEmpty
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: Column(
                                                      children:
                                                          // if userrole == owner
                                                          alertsController
                                                              .requestToJoin
                                                              .value
                                                              .map((dynamic
                                                                  request) {
                                                    return Batch_Student(
                                                        name: request['name'],
                                                        mobile:
                                                            request['mobile'],
                                                        subject:
                                                            request['subject']);
                                                  }).toList()),
                                                )
                                              : const Center(
                                                  child: Text(
                                                      'No Requests Found!'),
                                                ));

                                        default:
                                          if (snapshot.hasError) {
                                            return const Center(
                                                child: Text(
                                                    'Oops! something went wrong'));
                                          } else {
                                            return const Center(
                                                child: Text(
                                                    'Oops! something went wrong'));
                                          }
                                      }
                                    }),
                              ],
                            ),
                            CustomButton(onPressed: () {}, text: "update")
                          ],
                        )
                      ],
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}
