import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instituto/controller/batch_controller.dart';
import 'package:instituto/features/batch/widgets/notice.dart';
import 'package:instituto/models/batch_models.dart';

class NoticesSlide extends StatefulWidget {
  final List notices;
  const NoticesSlide({super.key, required this.notices});

  @override
  State<NoticesSlide> createState() => NoticesSlideState();
}

class NoticesSlideState extends State<NoticesSlide> {
  final batchController = Get.put((BatchController()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Notice Board Is Empty!',
        ),
      ),
    );
  }
}
