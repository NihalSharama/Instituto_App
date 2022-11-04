import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/unauthorized_screen.dart';
import 'package:instituto/controller/auth_controllers.dart';
import 'package:instituto/features/auth/screens/login_screen.dart';
import 'package:instituto/features/auth/services/auth_service.dart';
import 'package:instituto/features/chats/chats_screen.dart';
import 'package:instituto/features/dashboard/screens/dashboard.dart';
import 'package:instituto/features/home/screens/home_screen.dart';
import 'package:instituto/features/home/widgets/create_subject_popup.dart';
import 'package:instituto/features/notifications/screens/notification_screen.dart';
import 'package:instituto/features/profile/screens/profile_screen.dart';
import 'package:instituto/models/user.dart';

class LandingScreen extends StatefulWidget {
  final String subRoute;
  static const String routeName = '/landing/';
  const LandingScreen({super.key, required this.subRoute});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final authController = Get.put((AuthController()));
  final prevRoute = Get.previousRoute;
  @override
  void initState() {
    // removeToken();

    Future.delayed(Duration.zero, () async {
      final token = await getToken();
      final user = await UserStorage().getUser();

      // await AuthServices.featch_token();

      if (token == null) {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      } else if ((user['institutes'].isEmpty) & (user['role'] != 'Owner')) {
        Navigator.pushReplacementNamed(context, UnAuthorizedScreen.routeName);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (widget.subRoute == HomePage.routeName) {
          return HomePage();
        } else if (widget.subRoute == RecentChatsScreen.routeName) {
          return const RecentChatsScreen();
        } else if (widget.subRoute == NotificationScreen.routeName) {
          return const NotificationScreen();
        } else if (widget.subRoute == ProfileScreen.routeName) {
          return const ProfileScreen();
        } else if (widget.subRoute == DashboardScreen.routeName) {
          return const DashboardScreen();
        } else {
          return const Center(child: Text('No page found!'));
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(
              context, '/landing/${DashboardScreen.routeName}');
        },
        elevation: 40,
        child: const Icon(Icons.dashboard),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 200, 200, 200),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset('assets/icons/home.svg'),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, '/landing/${HomePage.routeName}');
              },
            ),
            IconButton(
                icon: SvgPicture.asset('assets/icons/message.svg'),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, '/landing/${RecentChatsScreen.routeName}');
                }),
            IconButton(
                icon: SvgPicture.asset('assets/icons/notification.svg'),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, '/landing/${NotificationScreen.routeName}');
                }),
            IconButton(
                icon: SvgPicture.asset('assets/icons/profile.svg'),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, '/landing/${ProfileScreen.routeName}');
                })
          ],
        ),
      ),
    );
  }
}
