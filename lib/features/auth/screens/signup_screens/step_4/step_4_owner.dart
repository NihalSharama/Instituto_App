import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/common/widgets/triple_selection_buttons.dart';
import 'package:instituto/controller/auth_controllers.dart';

class SignupStep4Owner extends StatefulWidget {
  const SignupStep4Owner({Key? key, required this.signupFormKeys})
      : super(key: key);
  final List<GlobalKey<FormState>> signupFormKeys;

  @override
  State<SignupStep4Owner> createState() => _SignupStep4OwnerState();
}

class _SignupStep4OwnerState extends State<SignupStep4Owner> {
  final authController = Get.put((AuthController()));

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Form(
              key: widget.signupFormKeys[3],
              child: Column(
                children: [
                  CustomTextField(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Institute Address';
                        }
                        return null;
                      },
                      controller: authController.instituteNameController,
                      hintText: 'Institute Address'),
                  CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Email';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Entered Email Is Wrong';
                        }

                        return null;
                      },
                      controller: authController.emailController,
                      hintText: 'Your Email'),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'About Yourself';
                      } else if (value.length <= 2) {
                        return 'Description Should Atleast Contain 3 Letters';
                      } else if (value.length > 40) {
                        return 'Description should be less then 40 letters';
                      }

                      return null;
                    },
                    controller: authController.aboutYourselfController,
                    hintText: 'About Yourself',
                    maxLines: 5,
                    paddingTop: 15,
                  ),
                ],
              )),
          TripleSelectionButtons(
            field: authController.gender.value,
            firstButtonText: 'Male',
            secondButtonText: 'Female',
            thirdButtonText: 'Other',
            title: 'Gender',
            onFirstButtonPress: authController.onMalePress,
            onSecondButtonPress: authController.onFemalePress,
            onThirdButtonPress: authController.onOtherPress,
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
