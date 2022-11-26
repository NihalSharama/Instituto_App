// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/global_variables.dart';

class TeachersRacking extends StatelessWidget {
  final String name;
  final String ranking;
  final String totalStudent;
  final String slaray;

  const TeachersRacking({
    Key? key,
    required this.name,
    required this.ranking,
    required this.totalStudent,
    required this.slaray,
    required String mobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => print("Stories clicked"),
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/chemistry.png")),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    ranking.toString(),
                    style: const TextStyle(
                        fontSize: 6, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset("assets/icons/star.svg"),
                  SvgPicture.asset("assets/icons/star.svg"),
                  SvgPicture.asset("assets/icons/star.svg"),
                  SvgPicture.asset("assets/icons/star.svg"),
                  SvgPicture.asset("assets/icons/half_star.svg"),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "STUDENTS",
                    style: TextStyle(
                        fontSize: 6,
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    totalStudent,
                    style: const TextStyle(
                        fontSize: 6,
                        color: AppColors.mainColorlite,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Row(
                children: [
                  const Text(
                    "SALARY",
                    style: TextStyle(
                        fontSize: 6,
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    slaray,
                    style: const TextStyle(
                        fontSize: 6,
                        color: AppColors.mainColorlite,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ]),
      ],
    );
  }
}
