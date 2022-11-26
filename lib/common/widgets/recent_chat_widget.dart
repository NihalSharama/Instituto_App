// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instituto/constants/global_variables.dart';

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
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.grey.shade500,
                offset: const Offset(4, 4)),
            BoxShadow(
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.grey.shade500,
                offset: const Offset(1, 1))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Text(batch,
                            style: TextStyle(
                                fontSize: 8, fontWeight: FontWeight.w600)),
                        const SizedBox(
                          width: 10,
                        ),
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
                        const SizedBox(
                          width: 4,
                        ),
                        Text(description,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 8, fontWeight: FontWeight.w600)),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "3",
                          style: TextStyle(fontSize: 4, color: Colors.white),
                        )),
                  ),
                  Text(
                    "4:00",
                    style: TextStyle(fontSize: 5, color: AppColors.mainColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
