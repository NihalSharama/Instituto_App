import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instituto/controller/alerts_controller.dart';
import 'package:instituto/features/alerts/widgets/request.dart';
import 'package:instituto/features/alerts/widgets/assign_class_subject_popup.dart';

class RequestsToJoin extends StatefulWidget {
  static const String routeName = '/request';
  const RequestsToJoin({Key? key}) : super(key: key);

  @override
  State<RequestsToJoin> createState() => _RequestsToJoinState();
}

class _RequestsToJoinState extends State<RequestsToJoin> {
  final alertsController = Get.put((AlertsController()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: -5,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, size: 15),
        ),
        title: const Text(
          "Teacher\'s Request",
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Column(
          children:
              // if userrole == owner
              alertsController.teachersRequestToJoin.value
                  .map((dynamic request) {
        return RequestComponent(
            name: request['name'],
            mobile: request['mobile'],
            subject: request['subject']);
      }).toList()), // map the requests from alertsController
    );
  }
}
