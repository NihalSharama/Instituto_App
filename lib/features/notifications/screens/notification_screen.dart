import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/user_controller.dart';
import 'package:instituto/features/notifications/screens/notifications_slide.dart';
import 'package:instituto/features/notifications/screens/requests_slide.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = 'notifications';
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final userController = Get.put((UserController()));

  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          if (userController.user.value!.role == 'Owner') ...[
            PreferredSize(
              // ignore: sort_child_properties_last
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: AppColors.mainColor,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: AppColors.mainColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: TextStyle(fontWeight: FontWeight.w600),
                      tabs: const [
                        Tab(
                          text: "NOTIFICATIONS",
                        ),
                        Tab(
                          text: "REQUESTS",
                        )
                      ]),
                ),
              ),
              preferredSize: const Size.fromHeight(kToolbarHeight),
            ),
            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: const [NotificationSlide(), RequestsToJoin()]),
            ),
          ],
          if (userController.user.value!.role == 'Teacher') ...[
            const SizedBox(height: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'NOTIFICATIONS',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.titleColorExtraLight,
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  height: 3,
                  color: AppColors.mainColor,
                ),
              ],
            ),
            const NotificationSlide()
          ]
        ],
      ),
    );
  }
}
