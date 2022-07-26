import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/common/widgets/triple_selection_buttons.dart';
import 'package:instituto/controller/auth_controllers.dart';

class SignupStep4Student extends StatefulWidget {
  const SignupStep4Student({Key? key, required this.signupFormKeys})
      : super(key: key);
  final List<GlobalKey<FormState>> signupFormKeys;

  @override
  State<SignupStep4Student> createState() => _SignupStep4StudentState();
}

class _SignupStep4StudentState extends State<SignupStep4Student> {
  final authController = Get.put((AuthController()));

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: widget.signupFormKeys[3],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Father Name';
                } else if (value.length <= 2) {
                  return 'Name should contain atleast 3 letter';
                } else if (value.length > 20) {
                  return 'Name Too long';
                }
                return null;
              },
              controller: authController.fathersNameController,
              hintText: "Father's Name",
            ),
            CustomTextField(
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Mother Name';
                } else if (value.length <= 2) {
                  return 'Name should contain atleast 3 letter';
                } else if (value.length > 20) {
                  return 'Name Too long';
                }
                return null;
              },
              controller: authController.mothersNameController,
              hintText: "Mother's Name",
            ),
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Your Email';
                } else if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return 'Entered Email Is Wrong';
                }

                return null;
              },
              controller: authController.emailController,
              hintText: "Your Email",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50),
              child: TripleSelectionButtons(
                field: authController.gender.value,
                firstButtonText: 'Male',
                secondButtonText: 'Female',
                thirdButtonText: 'Other',
                title: 'Gender',
                onFirstButtonPress: authController.onMalePress,
                onSecondButtonPress: authController.onFemalePress,
                onThirdButtonPress: authController.onOtherPress,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
