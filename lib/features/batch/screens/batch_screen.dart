import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/batch_controller.dart';
import 'package:instituto/features/batch/screens/batch_edit.dart';
import 'package:instituto/features/batch/screens/chat_slide.dart';
import 'package:instituto/features/batch/screens/docbox_slide.dart';
import 'package:instituto/features/batch/screens/notices_slide.dart';
import 'package:instituto/features/home/screens/home_screen.dart';
import 'package:instituto/features/landing.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class BatchScreen extends StatefulWidget {
  final String id;
  const BatchScreen({
    super.key,
    required this.id,
  });
  static const String routeName = '/batch/';

  @override
  State<BatchScreen> createState() => _BatchScreenState();
}

class _BatchScreenState extends State<BatchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final batchController = Get.put((BatchController()));
  var selectedMenu;

  @override
  void initState() {
    // removeToken();
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 40),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context,
                                LandingScreen.routeName + HomePage.routeName);
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            color: AppColors.mainColor,
                            size: 40,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, BatchEdit.routeName + widget.id);
                            },
                            child: SvgPicture.asset(
                              'assets/icons/NavToogle.svg',
                              color: AppColors.mainColor,
                            )),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PHYSICS 11TH',
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColors.titleColorLight,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5),
                    ),
                    Row(
                      children: const [
                        Text(
                          '11TH',
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.titleColorExtraLight,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '\u2022 PHYSICS',
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.titleColorExtraLight,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PreferredSize(
                // ignore: sort_child_properties_last
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: AppColors.mainColor,
                      unselectedLabelColor: AppColors.titleColorLight,
                      indicatorColor: AppColors.mainColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: TextStyle(fontWeight: FontWeight.w600),
                      tabs: const [
                        Tab(
                          text: "Chats",
                        ),
                        Tab(
                          text: "DocBox",
                        ),
                        Tab(
                          text: "Notices",
                        )
                      ]),
                ),
                preferredSize: const Size.fromHeight(kToolbarHeight),
              )
            ],
          ),
        ),
        FutureBuilder(
            future: batchController.featchBatchDetails('1'),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return Expanded(
                child: TabBarView(controller: _tabController, children: [
                  ChatSlide(
                      messages: batchController.batchDetails.value!.messages),
                  DocBoxSlide(),
                  NoticesSlide(),
                ]),
              );
            }),
      ],
    ));
  }
}
