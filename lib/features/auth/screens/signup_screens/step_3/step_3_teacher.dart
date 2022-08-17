import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/controller/auth_controllers.dart';

class SignupStep3Teacher extends StatefulWidget {
  const SignupStep3Teacher({Key? key, required this.signupFormKeys})
      : super(key: key);
  final List<GlobalKey<FormState>> signupFormKeys;
  @override
  State<SignupStep3Teacher> createState() => _SignupStep3TeacherState();
}

class _SignupStep3TeacherState extends State<SignupStep3Teacher> {
  final authController = Get.put((AuthController()));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: widget.signupFormKeys[2],
          child: CustomTextField(
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Institute Code ';
                }
                return null;
              },
              controller: authController.instituteCodeController,
              hintText: 'Institute Code'),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
