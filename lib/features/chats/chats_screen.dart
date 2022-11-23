import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecentChatsScreen extends StatefulWidget {
  static const String routeName = 'chats';
  const RecentChatsScreen({super.key});

  @override
  State<RecentChatsScreen> createState() => _RecentChatsScreenState();
}

class _RecentChatsScreenState extends State<RecentChatsScreen> {
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
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10, spreadRadius: 1, color: Colors.grey)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/sample.jpg"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Aditya Paswan",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Text("ASTHETIC KA 14",
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.w600)),
                            Text("FUCK BITCHES",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false,
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.w600))
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assetName"),
                            Text("You",
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.w600)),
                            Text(
                                "Sir log bolte ha guru dost sman hota.. 🙃 ek bitch idhr bhi phek do 😭  ",
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.w600)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
