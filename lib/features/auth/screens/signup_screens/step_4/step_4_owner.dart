import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/common/widgets/triple_selection_buttons.dart';
import 'package:instituto/controller/auth_controllers.dart';

class SignupStep4Owner extends GetView<AuthController> {
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Form(
              child: Column(
            children: [
              CustomTextField(
                  controller: controller.instituteNameController,
                  hintText: 'Institute Address'),
              CustomTextField(
                  controller: controller.emailController,
                  hintText: 'Your Email'),
              CustomTextField(
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
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
