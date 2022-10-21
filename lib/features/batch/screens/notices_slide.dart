import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instituto/controller/batch_controller.dart';
import 'package:instituto/features/batch/widgets/notice.dart';
import 'package:instituto/models/batch_models.dart';

class NoticesSlide extends StatefulWidget {
  const NoticesSlide({super.key});

  @override
  State<NoticesSlide> createState() => NoticesSlideState();
}

class NoticesSlideState extends State<NoticesSlide> {
  final batchController = Get.put((BatchController()));
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: batchController.featchNotices('1'),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return (batchController.notices.value != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                      children: batchController.notices.value!
                          .map((NoticeModel notice) {
                    return NoticeComponent(
                      title: notice.title,
                      description: notice.description,
                      from: notice.from,
                      timestamp: notice.timestamp,
                      file: notice.file,
                    );
                  }).toList()),
                )
              : const Center(
                  child: Text('Notice Board Is Empty!'),
                ));
        });
  }
}
