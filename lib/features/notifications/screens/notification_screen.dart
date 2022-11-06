import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instituto/constants/global_variables.dart';
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
      ),
    );
  }
}
