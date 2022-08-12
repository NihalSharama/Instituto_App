import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/controller/auth_controllers.dart';

class SignupStep3Teacher extends GetView<AuthController> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: CustomTextField(
              controller: controller.instituteCodeController,
              hintText: 'Institute Code'),
        ),
        SizedBox(height: 100),
      ],
    );
  }
}
