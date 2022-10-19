import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instituto/controller/alerts_controller.dart';
import 'package:instituto/features/alerts/services/alerts_services.dart';
import 'package:instituto/features/alerts/widgets/request.dart';
import 'package:instituto/features/alerts/widgets/assign_class_subject_popup.dart';
import 'package:instituto/features/home/screens/home_screen.dart';
import 'package:instituto/features/landing.dart';

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
              Navigator.pushReplacementNamed(context, LandingScreen.routeName);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 15),
          ),
          title: const Text(
            "Teacher's Request",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        body: FutureBuilder(
          future: alertsController.featchTacherRequest(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                    child: Text('Featching Teacher Requests...'));
              case ConnectionState.done:
                return Center(
                    child:
                        (alertsController.teachersRequestToJoin.value.isNotEmpty
                            ? Column(
                                children:
                                    // if userrole == owner
                                    alertsController.teachersRequestToJoin.value
                                        .map((dynamic request) {
                                return RequestComponent(
                                    name: request['name'],
                                    mobile: request['mobile'],
                                    subject: request['subject']);
                              }).toList())
                            : const Center(
                                child: Text('No Requests Found!'),
                              )));

              default:
                if (snapshot.hasError) {
                  return const Center(
                      child: Text('Oops! something went wrong'));
                } else {
                  return const Center(
                      child: Text('Oops! something went wrong'));
                }
            }
          },
        ) // map the requests from alertsController
        );
  }
}
