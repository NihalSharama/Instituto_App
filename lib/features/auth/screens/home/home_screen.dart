import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/common/widgets/curve_widgets.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_clipper.dart';

import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/features/auth/screens/custom_bottom_navigation.dart';
import 'package:instituto/features/auth/screens/login_screen.dart';

import '../../../../controller/auth_controllers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  final authController = Get.put((AuthController()));
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    Future.delayed(Duration.zero, () async {
      var token = await getToken();
      if (token == null) {
        authController.isAuthenticated = false;
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Insituto',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'assets/icons/NavToogle.svg'))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Hi, Nihal Sharma',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "OWNER",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "@success_point",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 150,
                    child: Align(
                      alignment: Alignment.centerLeft,
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
                              text: "TEACHERS",
                            ),
                            Tab(
                              text: "BATCHES",
                            )
                          ]),
                    ),
                  ),

                  // yahha pelna hai
                ],
              ),
            ),
          ),

          //yaha pe dena hai

          Expanded(
            child: Container(
              child: TabBarView(controller: _tabController, children: [
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Teachers are not found',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    Text("Invite using + Button",
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Text("Also Check Requests")
                  ],
                )),
                Center(child: Text("Batches are not found"))
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: SvgPicture.asset('assets/icons/plus.svg')),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}