import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/features/batches/screens/batches_screen.dart';
import 'package:instituto/features/chats/chats_screen.dart';
import 'package:instituto/features/dashboard/screens/dashboard.dart';
import 'package:instituto/features/home/screens/home_screen.dart';
// import 'package:instituto/features/alerts/screens/notification_screen.dart';
// import 'package:instituto/features/profile/screens/gitprofile_screen.dart';

import '../../notifications/screens/notification_screen.dart';
import '../../profile/screens/profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushNamed(
        context,
        HomePage.routeName,
      );
    } else if (index == 1) {
      Navigator.pushNamed(
        context,
        RecentChatsScreen.routeName,
      );
    } else if (index == 2) {
      Navigator.pushNamed(context, NotificationScreen.routeName);
    } else if (index == 3) {
      Navigator.pushNamed(context, ProfileScreen.routeName);
    } else if (index == 4) {
      Navigator.pushNamed(context, DashboardScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemTapped(5);
        },
        child: Icon(Icons.dashboard),
        elevation: 10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.mainColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home.svg'), label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/message.svg'),
              label: "Messages"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/notification.svg'),
              label: "Notification"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/profile.svg'),
              label: "Profile")
        ],
      ),
    );
  }
}
