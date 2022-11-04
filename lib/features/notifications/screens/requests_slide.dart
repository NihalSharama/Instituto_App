import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/controller/alerts_controller.dart';
import 'package:instituto/features/notifications/widgets/request.dart';

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
    return FutureBuilder(
        future: alertsController.featchTacherRequest(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: Text('Featching Teacher Requests...'));
            case ConnectionState.done:
              return (alertsController.requestToJoin.value.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                          children:
                              // if userrole == owner
                              alertsController.requestToJoin.value
                                  .map((dynamic request) {
                        return RequestComponent(
                            name: request['teacher']['first_name'] +
                                ' ' +
                                request['teacher']['last_name'],
                            mobile: request['teacher']['mobile'].toString(),
                            subject: 'Physics',
                            teacherId:
                                '16'); // request['teacher']['id'].toString()
                      }).toList()),
                    )
                  : const Center(
                      child: Text('No Requests Found!'),
                    ));

            default:
              if (snapshot.hasError) {
                return const Center(child: Text('Oops! something went wrong'));
              } else {
                return const Center(child: Text('Oops! something went wrong'));
              }
          }
        });
  }
}
