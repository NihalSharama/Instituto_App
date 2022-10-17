import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatCard extends StatefulWidget {
  final message;
  const ChatCard({super.key, required this.message});

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${widget.message['data']}'),
    );
  }
}
