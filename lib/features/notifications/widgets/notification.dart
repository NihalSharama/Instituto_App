import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/alerts_controller.dart';

class NotficationComponent extends StatefulWidget {
  final String title;
  final String description;
  final String from;
  final DateTime timeStamp;
  final altersController = Get.put((AlertsController()));
  NotficationComponent(
      {super.key,
      required this.title,
      required this.description,
      required this.from,
      required this.timeStamp});

  @override
  State<NotficationComponent> createState() => _NotficationComponentState();
}

class _NotficationComponentState extends State<NotficationComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
          // height: 100,
          width: double.infinity,
          // ignore: sort_child_properties_last
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FROM: ${widget.from}',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainColor,
                        letterSpacing: 1.2),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.description,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.descriptionColorLight,
                        letterSpacing: 1.2),
                  ),
                  const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '2:00PM',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.descriptionColorLight,
                            letterSpacing: 1.2),
                      ))
                ],
              )),
          decoration: const BoxDecoration(
              border: Border(
                  left: BorderSide(color: AppColors.mainColor, width: 4)),
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
              ])),
    );
  }
}
