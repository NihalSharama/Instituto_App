import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instituto/constants/global_variables.dart';

class UnAuthorizedScreen extends StatefulWidget {
  const UnAuthorizedScreen({super.key});
  static const String routeName = '/un-authorized/';

  @override
  State<UnAuthorizedScreen> createState() => _UnAuthorizedScreenState();
}

class _UnAuthorizedScreenState extends State<UnAuthorizedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/unauthorized_screen.png"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Hi 👋",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "AdityaPaswan",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: AppColors.maintextColor),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                "Your Request has been sent, You will soon join the best managment community 😉",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
