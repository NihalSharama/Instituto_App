import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/features/auth/screens/home/home_page.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text("Messages"),
    Text("Batches"),
    Text("Notifications"),
    Text("Profile"),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndex]),
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
                icon: SvgPicture.asset('assets/icons/batches.svg'),
                label: "Batches"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/notification.svg'),
                label: "Notification"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/profile.svg'),
                label: "Profile")
          ]),
    );
  }
}
