import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/features/batches/screens/batches_screen.dart';
import 'package:instituto/features/chats/chats_screen.dart';
import 'package:instituto/features/dashboard/screens/dashboard.dart';
import 'package:instituto/features/home/screens/home_screen.dart';
import 'package:instituto/features/alerts/screens/notification_screen.dart';
import 'package:instituto/features/profile/screens/profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                HomePage.routeName,
              );
            },
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
            )),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RecentChatsScreen.routeName,
              );
            },
            icon: SvgPicture.asset('assets/icons/message.svg')),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RecentChatsScreen.routeName,
              );
            },
            icon: SvgPicture.asset('assets/icons/batches.svg')),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationScreen.routeName);
            },
            icon: SvgPicture.asset('assets/icons/notification.svg')),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/profile.svg')),
      ],
    ));
  }
}
