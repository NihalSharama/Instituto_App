import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/home_controller.dart';
import 'package:instituto/controller/user_controller.dart';
import 'package:instituto/features/home/screens/batches_slide.dart';
import 'package:instituto/features/home/screens/teachers_slide.dart';
import 'package:instituto/features/home/widgets/create_batch_popup.dart';
import 'package:instituto/features/home/widgets/create_subject_popup.dart';
import 'package:instituto/models/user.dart';

import '../../../Settings/pages/setting_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  final homeController = Get.put((HomeController()));
  final userController = Get.put((UserController()));
  late TabController _tabController;
  final prevRoute = Get.previousRoute;
  int _selectedIndex = 0;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final UserModel? user = await UserStorage().getUser();

      if ((user!.role == 'Owner')) {
        // & (prevRoute == '/signup')
        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       // return const CreateSubjectPopup();
        //       return const CreateBatchePopup();
        //     });
      }
    });
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.4,
          maxChildSize: 0.9,
          minChildSize: 0.32,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: const SettingPage(),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userController.loadUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Scaffold(
            body: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(StaticImages.appBarCurve),
                          fit: BoxFit.contain,
                          alignment: Alignment.topCenter)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Insituto',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        _showModalBottomSheet(context);
                                      },
                                      icon: SvgPicture.asset(
                                          'assets/icons/NavToogle.svg'))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Hi, ${userController.user.value?.firstname} ${userController.user.value?.lastname}',
                                style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              '${userController.user.value?.role.toUpperCase()}',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const Text(
                              "@success_point",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        if (userController.user.value?.role == 'Owner') ...{
                          PreferredSize(
                            // ignore: sort_child_properties_last
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TabBar(
                                  controller: _tabController,
                                  isScrollable: true,
                                  labelColor: AppColors.mainColor,
                                  unselectedLabelColor: Colors.black,
                                  indicatorColor: AppColors.mainColor,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.w600),
                                  tabs: const [
                                    Tab(
                                      text: "TEACHES",
                                    ),
                                    Tab(
                                      text: "BATCHES",
                                    )
                                  ]),
                            ),
                            preferredSize:
                                const Size.fromHeight(kToolbarHeight),
                          )
                        },
                        if (userController.user.value?.role == 'Teacher' ||
                            userController.user.value?.role == 'Student') ...{
                          const SizedBox(height: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'BATCHES',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.titleColorExtraLight,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Container(
                                width: 30,
                                height: 2,
                                color: AppColors.mainColor,
                              ),
                            ],
                          ),
                        }
                      ],
                    ),
                  ),
                ),
                if (userController.user.value?.role == 'Owner') ...{
                  Expanded(
                    child: TabBarView(controller: _tabController, children: [
                      const TeachersSlide(),
                      BatchesSlide(userRole: userController.user.value!.role)
                    ]),
                  ),
                },
                if (userController.user.value?.role == 'Teacher' ||
                    userController.user.value?.role == 'Student') ...{
                  Expanded(
                      child: Center(
                    child: BatchesSlide(
                      userRole: userController.user.value!.role,
                    ),
                  )),
                }
              ],
            ),
          );
        });
  }
}
