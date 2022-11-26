import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/alerts_controller.dart';

class Batch_Student extends StatelessWidget {
  final String name;
  final String mobile;
  final String subject;
  final altersController = Get.put((AlertsController()));

  Batch_Student(
      {Key? key,
      required this.name,
      required this.mobile,
      required this.subject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              minRadius: 30,
              maxRadius: 30,
              backgroundImage: AssetImage('assets/images/dummy_image.png'),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Text(
                subject,
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    "Contact No :",
                    style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      mobile,
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
