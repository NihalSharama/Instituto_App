import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.put((ProfileController()));
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: profileController.featchProfileDetails('1'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                        radius: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profileController.profileDetails.value!.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Text(
                                "Institute :",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.titleColorLight),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                profileController
                                    .profileDetails.value!.Institute,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.titleColorLight),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Subjects:',
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.titleColorLight),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                profileController.profileDetails.value!.subject,
                                style: const TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainColor),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              // Text(
                              //   "Chemistry",
                              //   style: TextStyle(
                              //       fontSize: 8,
                              //       fontWeight: FontWeight.bold,
                              //       color: AppColors.mainColor),
                              // ),
                              // SizedBox(
                              //   width: 5,
                              // ),
                              // Text(
                              //   "Maths",
                              //   style: TextStyle(
                              //       fontSize: 8,
                              //       fontWeight: FontWeight.bold,
                              //       color: AppColors.mainColor),
                              // )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Class :",
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.titleColorLight),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                profileController.profileDetails.value!.Class,
                                style: const TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainColor),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtonBordered(text: 'Edit Profile', onPressed: () {})
                ],
              ),
            ),
          );
        });
  }
}
