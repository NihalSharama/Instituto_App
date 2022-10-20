import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:instituto/controller/alerts_controller.dart';

import '../../../../../constants/global_variables.dart';

class BatchComponent extends StatelessWidget {
  final String batch_name;
  final String teacher_name;
  final String subject;
  final String timing;
  final altersController = Get.put((AlertsController()));
  BatchComponent(
      {Key? key,
      required this.subject,
      required this.batch_name,
      required this.teacher_name,
      required this.timing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Container(
            height: 85,
            width: double.infinity,
            // ignore: sort_child_properties_last
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          minRadius: 30,
                          maxRadius: 30,
                          backgroundImage:
                              AssetImage('assets/images/dummy_image.png'),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            batch_name.toUpperCase(),
                            style: const TextStyle(
                                color: AppColors.titleColorLight,
                                fontSize: 16,
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w800),
                          ),
                          Row(
                            children: [
                              Text(
                                teacher_name.toUpperCase(),
                                style: const TextStyle(
                                    color: AppColors.titleColorLight,
                                    wordSpacing: 1,
                                    letterSpacing: 1.4,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "\u2022 ${subject.toUpperCase()}",
                                style: const TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 1.4,
                                    color: AppColors.titleColorLight,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Text(
                            "\u2022 $timing",
                            style: const TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 1.4,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: AppColors.mainColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [],
                  )
                ],
              ),
            ),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 211, 211, 211))))));
  }
}
