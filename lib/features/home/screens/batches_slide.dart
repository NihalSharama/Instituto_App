import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/controller/home_controller.dart';
import 'package:instituto/features/home/widgets/batch.dart';

class BatchesSlide extends StatelessWidget {
  const BatchesSlide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put((HomeController()));
    return SingleChildScrollView(
      child: FutureBuilder(
        future: homeController.featchBatches(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: Text('Featching Batches...'));
            case ConnectionState.done:
              return Center(
                  child: (homeController.batches.value.isNotEmpty
                      ? Column(
                          children:
                              // if userrole == owner
                              homeController.batches.value
                                  .map((dynamic request) {
                          return GestureDetector(
                              onTap: () {},
                              child: BatchComponent(
                                  batch_name: request['batch_name'],
                                  teacher_name: request['teacher_name'],
                                  timing: request['timing'],
                                  subject: request['subject']));
                        }).toList())
                      : const Center(
                          child: Text('No Batches Found!'),
                        )));

            default:
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
          }
        },
      ),
    );
  }
}
