// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:instituto/constants/global_variables.dart';
// import 'package:instituto/features/batches/screens/batches_screen.dart';
// import 'package:instituto/features/chats/chats_screen.dart';
// import 'package:instituto/features/dashboard/screens/dashboard.dart';
// import 'package:instituto/features/home/screens/home_screen.dart';
// import 'package:instituto/features/alerts/screens/notification_screen.dart';
// import 'package:instituto/features/profile/screens/profile_screen.dart';

// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({Key? key}) : super(key: key);

//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Color.fromARGB(255, 199, 199, 199),
//       shape: const CircularNotchedRectangle(),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           IconButton(
//             icon: SvgPicture.asset('assets/icons/home.svg'),
//             onPressed: () {
//               Navigator.pushNamed(context, HomePage.routeName);
//             },
//           ),
//           IconButton(
//               icon: SvgPicture.asset('assets/icons/message.svg'),
//               onPressed: () {
//                 Navigator.pushNamed(context, RecentChatsScreen.routeName);
//               }),
//           IconButton(
//               icon: SvgPicture.asset('assets/icons/notification.svg'),
//               onPressed: () {
//                 Navigator.pushNamed(context, NotificationScreen.routeName);
//               }),
//           IconButton(
//               icon: SvgPicture.asset('assets/icons/profile.svg'),
//               onPressed: () {
//                 Navigator.pushNamed(context, ProfileScreen.routeName);
//               })
//         ],
//       ),
//     );
//   }
// }
