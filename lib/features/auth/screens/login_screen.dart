import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/curve_widgets.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/controller/auth_controllers.dart';
import 'package:instituto/features/auth/screens/signup_screens/signup_screen.dart';
import '/constants/global_variables.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.put((AuthController()));
  final signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
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
                      key: signInFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40, bottom: 15),
                            child: CustomTextField(
                                controller: authController.mobileController,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Enter your Phone No.';
                                  } else if (val.length > 10 ||
                                      val.length < 10) {
                                    return 'Length should have 10 digits';
                                  }
                                  return null;
                                },
                                hintText: 'Mobile No.'),
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
                              onPressed: () =>
                                  authController.onLogin(signInFormKey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
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
          ),
        ));
  }
}
