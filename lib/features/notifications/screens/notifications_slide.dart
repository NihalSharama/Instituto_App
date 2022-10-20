import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instituto/controller/alerts_controller.dart';
import 'package:instituto/features/notifications/widgets/notification.dart';
import 'package:instituto/models/alerts_models.dart';

class NotificationSlide extends StatefulWidget {
  const NotificationSlide({super.key});

  @override
  State<NotificationSlide> createState() => _NotificationSlideState();
}

class _NotificationSlideState extends State<NotificationSlide> {
  final alertsController = Get.put((AlertsController()));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: alertsController.featchNotifications(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return (alertsController.notifications.value != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                      children: alertsController.notifications.value!
                          .map((NotificationModel notification) {
                    return NotficationComponent(
                      title: notification.title,
                      description: notification.description,
                      from: notification.from,
                      timeStamp: notification.timestamp,
                    );
                  }).toList()),
                )
              : const Center(
                  child: Text('No Notifications Found!'),
                ));
        });
  }
}
