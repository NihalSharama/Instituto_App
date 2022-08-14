import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/common/widgets/triple_selection_buttons.dart';
import 'package:instituto/controller/auth_controllers.dart';

class SignupStep4Owner extends GetView<AuthController> {
  const SignupStep4Owner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Form(
              child: Column(
            children: [
              CustomTextField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Institute Address';
                    }
                    return null;
                  },
                  controller: controller.instituteNameController,
                  hintText: 'Institute Address'),
              CustomTextField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Email';
                    }
                    return null;
                  },
                  controller: controller.emailController,
                  hintText: 'Your Email'),
              CustomTextField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'About Yourself';
                  }
                  return null;
                },
                controller: controller.aboutYourselfController,
                hintText: 'About Yourself',
                maxLines: 5,
                paddingTop: 15,
              ),
            ],
          )),
          TripleSelectionButtons(
            field: controller.gender.value,
            firstButtonText: 'Male',
            secondButtonText: 'Female',
            thirdButtonText: 'Other',
            title: 'Gender',
            onFirstButtonPress: controller.onMalePress,
            onSecondButtonPress: controller.onFemalePress,
            onThirdButtonPress: controller.onOtherPress,
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
