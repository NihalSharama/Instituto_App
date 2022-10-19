import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instituto/features/auth/screens/custom_bottom_navigation.dart';

class RecentChatsScreen extends StatefulWidget {
  static const String routeName = 'chats';
  const RecentChatsScreen({super.key});

  @override
  State<RecentChatsScreen> createState() => _RecentChatsScreenState();
}

class _RecentChatsScreenState extends State<RecentChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text('Recent Chats'),
    ));
  }
}
