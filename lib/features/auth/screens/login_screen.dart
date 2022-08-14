import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/curve_widgets.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/controller/auth_controllers.dart';
import 'package:instituto/features/auth/screens/signup_screens/signup_screen.dart';
import '/constants/global_variables.dart';

class LoginScreen extends GetView<AuthController> {
  LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/login';
  final _signInFormKey = GlobalKey<FormState>();
  final authController = Get.put((AuthController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const CircualCurve(),
            Container(
                child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Happy to see you again :)",
                      style: TextStyle(
                          color: AppColors.descriptionColorLight,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text("Login",
                        style: TextStyle(
                            color: AppColors.titleColor,
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.4)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("Please sign in to continue",
                      style: TextStyle(
                          color: AppColors.descriptionColorLight,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  Form(
                    key: _signInFormKey,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 15),
                        child: TextFormField(
                            controller: controller.mobileController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(103, 204, 204, 204),
                              hintText: 'Mobile No',
                              contentPadding: const EdgeInsets.only(
                                  left: 20.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Enter your Phone No.';
                              } else if (val.length > 10 || val.length < 10) {
                                return 'Length of should be 10';
                              }
                              return null;
                            })),
                  ),
                  const Text(
                    "Don’t have mobile no?",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.mainColor,
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: CustomButton(
                      text: "Login",
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 255),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Dont have a account? ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.descriptionColorLight),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, SignupScreen.routeName),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              color: AppColors.mainColor,
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}
