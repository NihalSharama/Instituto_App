import 'package:flutter/material.dart';

class RecentChatsScreen extends StatefulWidget {
  static const String routeName = 'chats';
  const RecentChatsScreen({super.key});

  @override
  State<RecentChatsScreen> createState() => _RecentChatsScreenState();
}

class _RecentChatsScreenState extends State<RecentChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Recent Chats'),
    );
  }
}
