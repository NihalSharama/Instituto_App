import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/common/widgets/triple_selection_buttons.dart';
import 'package:instituto/controller/auth_controllers.dart';

class SignupStep4Student extends GetView<AuthController> {
  const SignupStep4Student({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Father Name';
              }
              return null;
            },
            controller: controller.fathersNameController,
            hintText: "Father's Name",
          ),
          CustomTextField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Mother Name';
              }
              return null;
            },
            controller: controller.mothersNameController,
            hintText: "Mother's Name",
          ),
          CustomTextField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Your Email';
              }
              return null;
            },
            controller: controller.emailController,
            hintText: "Your Email",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 50),
            child: TripleSelectionButtons(
              field: controller.gender.value,
              firstButtonText: 'Male',
              secondButtonText: 'Female',
              thirdButtonText: 'Other',
              title: 'Gender',
              onFirstButtonPress: controller.onMalePress,
              onSecondButtonPress: controller.onFemalePress,
              onThirdButtonPress: controller.onOtherPress,
            ),
          ),
        ],
      ),
    );
  }
}
