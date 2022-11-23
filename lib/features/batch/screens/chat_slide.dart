import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/models/batch_models.dart';

class ChatSlide extends StatefulWidget {
  final List<dynamic> messages;
  const ChatSlide({super.key, required this.messages});

  @override
  State<ChatSlide> createState() => _ChatSlideState();
}

class _ChatSlideState extends State<ChatSlide> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          if (widget.messages.isNotEmpty)
            Column(
                children:
                    // if userrole == owner
                    widget.messages.map((message) {
              return Align(
                alignment: (message.from == 'nihal'
                    ? Alignment.centerRight
                    : Alignment.centerLeft),
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (message.from != 'nihal') ...{
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                message.from,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                            )
                          },
                          Card(
                            color: (message.from == 'nihal'
                                ? AppColors.mainColor
                                : Color.fromARGB(255, 221, 221, 221)),
                            shape: RoundedRectangleBorder(
                                borderRadius: (message.from == 'nihal'
                                    ? const BorderRadius.only(
                                        topRight: Radius.circular(0),
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))
                                    : const BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)))),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                message.text,
                                style: TextStyle(
                                    color: (message.from == 'nihal'
                                        ? Colors.white
                                        : AppColors.titleColor)),
                              ),
                            ),
                          ),
                        ])),
              );
            }).toList())
          else
            const Text('No Messages Found!')
        ],
      ),
    ));
  }
}
