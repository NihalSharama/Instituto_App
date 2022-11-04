import 'package:flutter/material.dart';

class TeachersRacking extends StatelessWidget {
  const TeachersRacking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          minRadius: 30,
          maxRadius: 30,
          backgroundImage: AssetImage('assets/images/dummy_image.png'),
        ),
        Column(
          children: [
            Text("Nihal Sharma"),
          ],
        )
      ],
    );
  }
}
