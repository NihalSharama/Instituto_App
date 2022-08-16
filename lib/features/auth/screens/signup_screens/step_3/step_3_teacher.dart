import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/controller/auth_controllers.dart';

class SignupStep3Teacher extends GetView<AuthController> {
  const SignupStep3Teacher({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: controller.singupFormKeys[2],
          child: CustomTextField(
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Institute Code ';
                }
                return null;
              },
              controller: controller.instituteCodeController,
              hintText: 'Institute Code'),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
