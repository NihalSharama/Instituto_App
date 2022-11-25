// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentChatWidget extends StatelessWidget {
  final String name;
  final String image;
  final String batch;
  final String topic;
  final String description;

  const RecentChatWidget({
    Key? key,
    required this.name,
    required this.image,
    required this.batch,
    required this.topic,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(blurRadius: 10, spreadRadius: 1, color: Colors.grey)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(image),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Row(
                    children: [
                      Text(batch,
                          style: TextStyle(
                              fontSize: 8, fontWeight: FontWeight.w600)),
                      Text(topic,
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
                      Text(description,
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
    );
  }
}
