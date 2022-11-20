import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:instituto/controller/alerts_controller.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/global_variables.dart';

class StudentRequestComponent extends StatelessWidget {
  final String name;
  final String mobile;
  final String subject;
  final String teacherId;
  final String requestId;

  final altersController = Get.put((AlertsController()));
  StudentRequestComponent(
      {Key? key,
      required this.name,
      required this.mobile,
      required this.subject,
      required this.teacherId,
      required this.requestId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 100,
        width: double.infinity,
        // ignore: sort_child_properties_last
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        subject,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.phone_android_outlined,
                                    color: AppColors.mainColor,
                                    size: 12,
                                  ),
                                  Text(
                                    mobile,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                      color: AppColors.mainColor,
                                    ),
                                  )
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('dd MM yyyy  , KK mm').format(DateTime.now()),
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                            height: 27, width: 70),
                        child: ElevatedButton(
                          onPressed: () {
                            // dicline that mf request
                          },
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.backgroundGrayDark,
                              onPrimary: Colors.black,
                              textStyle: const TextStyle(
                                  fontSize: 9.5, fontWeight: FontWeight.w600)),
                          child: const Text("DECLINE"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                            height: 27, width: 70),
                        child: ElevatedButton(
                          onPressed: () {
                            // accept the fucking request
                          },
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontSize: 9.5, fontWeight: FontWeight.w600)),
                          child: const Text("ACCEPT"),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        decoration: const BoxDecoration(
            border:
                Border(left: BorderSide(color: AppColors.mainColor, width: 4)),
            boxShadow: [
              BoxShadow(
                color: AppColors.backgroundGrayLight,
                offset: Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 7.0,
                spreadRadius: 1.5,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
            ]),
      ),
    );
  }
}
