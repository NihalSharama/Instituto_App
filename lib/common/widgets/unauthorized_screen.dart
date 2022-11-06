import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/models/user.dart';

class UnAuthorizedScreen extends StatefulWidget {
  const UnAuthorizedScreen({super.key});
  static const String routeName = '/un-authorized/';

  @override
  State<UnAuthorizedScreen> createState() => _UnAuthorizedScreenState();
}

class _UnAuthorizedScreenState extends State<UnAuthorizedScreen> {
  String userName = 'Nihal Sharma';

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final UserModel? user = await UserStorage().getUser();

      if (user != null) {
        setState(() {
          userName = '${user.firstname} ${user.lastname}';
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Insituto',
                  style:
                      TextStyle(fontSize: 20, color: AppColors.titleColorLight),
                ),
              ),
            ),
            Image.asset("assets/images/unauthorized_screen.png"),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Hey 😜",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              userName,
              style: const TextStyle(
                  fontSize: 30,
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
                    color: AppColors.textColor),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
