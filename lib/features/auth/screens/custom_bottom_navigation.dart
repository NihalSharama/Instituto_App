import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/features/auth/screens/home/batches/batches_screen.dart';
import 'package:instituto/features/auth/screens/home/chats/chats_screen.dart';
import 'package:instituto/features/auth/screens/home/home_screen.dart';
import 'package:instituto/features/auth/screens/home/notification/notification_screen.dart';
import 'package:instituto/features/auth/screens/home/profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  // static final List<Widget> _widgetOptions = <Widget>[
  //   HomePage(),
  //   Text("Messages"),
  //   Text("Batches"),
  //   Text("Notifications"),
  //   Text("Profile"),
  // ];
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, HomePage.routeName);
    } else if (index == 1) {
      Navigator.pushNamed(context, RecentChatsScreen.routeName);
    } else if (index == 2) {
      Navigator.pushNamed(context, BatchesScreen.routeName);
    } else if (index == 3) {
      Navigator.pushNamed(context, NotificationScreen.routeName);
    } else if (index == 4) {
      Navigator.pushNamed(context, ProfileScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
            icon: SvgPicture.asset('assets/icons/batches.svg'),
            label: "Batches"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/notification.svg'),
            label: "Notification"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/profile.svg'),
            label: "Profile")
      ],
    );
  }
}
