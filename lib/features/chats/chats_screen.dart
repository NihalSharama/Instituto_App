import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common/widgets/recent_chat_widget.dart';
import '../../controller/chats_controllers.dart';

class RecentChatsScreen extends StatefulWidget {
  static const String routeName = 'chats';
  const RecentChatsScreen({super.key});

  @override
  State<RecentChatsScreen> createState() => _RecentChatsScreenState();
}

class _RecentChatsScreenState extends State<RecentChatsScreen> {
  final chatScreenShowController = Get.put((ChatScreenShowController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "RECENT CHATS",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    width: 30,
                    height: 2.8,
                    color: Colors.blue,
                  ),
                ]),
                SvgPicture.asset("assets/icons/three_dot_menu.svg")
              ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
                future:
                    chatScreenShowController.featchChatScreenShowDetails('1'),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return RecentChatWidget(
                      name: chatScreenShowController
                          .chatScreenShowDetails.value!.name,
                      image: chatScreenShowController
                          .chatScreenShowDetails.value!.image,
                      batch: chatScreenShowController
                          .chatScreenShowDetails.value!.batch,
                      topic: chatScreenShowController
                          .chatScreenShowDetails.value!.topic,
                      description: chatScreenShowController
                          .chatScreenShowDetails.value!.description);
                }),
          )
        ]),
      ),
    ));
  }
}
