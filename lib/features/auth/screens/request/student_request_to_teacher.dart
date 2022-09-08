import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';

import '../../../../constants/global_variables.dart';

class StudentRequestToTeacher extends StatelessWidget {
  const StudentRequestToTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: Neumorphic(
          child: Container(
            height: 100,
            width: double.infinity,
            // ignore: sort_child_properties_last
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          minRadius: 30,
                          maxRadius: 30,
                          backgroundImage:
                              AssetImage('assets/images/dummy_image.png'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Nihal Sharma",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          const Text(
                            "Physics",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 3),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.phone_android_outlined,
                                        color: AppColors.mainColor,
                                        size: 12,
                                      ),
                                      Text(
                                        "+91 9818756512",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                          color: AppColors.mainColor,
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('dd MM yyyy  , KK mm')
                            .format(DateTime.now()),
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      // CustomButton(onPressed: () {}, text: "login")
                      Row(
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints.tightFor(
                              height: 27,
                              width: 75,
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: AppColors.backgroundGrayDark,
                                  onPrimary: Colors.black,
                                  textStyle: const TextStyle(
                                      fontSize: 9.5,
                                      fontWeight: FontWeight.w600)),
                              child: const Text("DECLINE"),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ConstrainedBox(
                            constraints: const BoxConstraints.tightFor(
                                height: 27, width: 75),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 9.5,
                                      fontWeight: FontWeight.w600)),
                              child: const Text("ACCEPT"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 15,
                spreadRadius: 1,
                offset: Offset(-5, -5),
                color: Colors.white,
              ),
              BoxShadow(
                blurRadius: 15,
                spreadRadius: 1,
                offset: Offset(5, 5),
                color: Colors.white,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
