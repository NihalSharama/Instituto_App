import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/controller/batch_controller.dart';
import 'package:instituto/features/batch/screens/batch_screen.dart';
import 'package:instituto/features/batch/services/batch_services.dart';
import 'package:instituto/features/home/widgets/batch.dart';
import 'package:instituto/features/landing.dart';
import 'package:instituto/features/notifications/screens/notification_screen.dart';

class BatchesSlide extends StatefulWidget {
  final String userRole;
  const BatchesSlide({
    Key? key,
    required this.userRole,
  }) : super(key: key);

  @override
  State<BatchesSlide> createState() => _BatchesSlideState();
}

class _BatchesSlideState extends State<BatchesSlide> {
  @override
  Widget build(BuildContext context) {
    final batchController = Get.put((BatchController()));

    return SingleChildScrollView(
      child: FutureBuilder(
        future: BatchServices.getBatches(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return Center(
                  child: (snapshot.data!.isNotEmpty
                      ? Column(
                          children:
                              // if userrole == owner
                              snapshot.data!.map((dynamic batch) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context,
                                    BatchScreen.routeName +
                                        batch['id'].toString());
                              },
                              child: BatchComponent(
                                  batch_name: batch['batch_name'],
                                  teacher_name: batch['teacher_name'],
                                  timing: '2:30PM - 4:00PM',
                                  subject: batch['subject_name']));
                        }).toList())
                      : Center(
                          child: Column(
                            children: [
                              const Text(
                                'No Batches Found!',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600),
                              ),
                              if (widget.userRole == 'Owner') ...{
                                const Text(
                                    "Let Your Teachers Handle Batches 😉"),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 1,
                                        shape: const StadiumBorder()),
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context,
                                          LandingScreen.routeName +
                                              NotificationScreen.routeName);
                                    },
                                    child: const Text(
                                      'Requests!',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    )),
                              },
                              if (widget.userRole == 'Teacher') ...{
                                const Text(
                                    "Tap The Button To Create Your Batch 😀"),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 1,
                                        shape: const StadiumBorder()),
                                    onPressed: () {},
                                    child: const Text(
                                      'Create Batch',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    )),
                              },
                              if (widget.userRole == 'Student') ...{
                                const Text(
                                    "Tap The Button To Join Your Batch 😀"),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 1,
                                        shape: const StadiumBorder()),
                                    onPressed: () {},
                                    child: const Text(
                                      'Join Batch',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    )),
                              }
                            ],
                          ),
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
