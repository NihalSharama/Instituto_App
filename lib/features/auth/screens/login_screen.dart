import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instituto/common/widgets/curve_widgets.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';
import 'package:instituto/controller/auth_controllers.dart';
import 'package:instituto/features/auth/screens/signup_screens/signup_screen.dart';
import 'package:instituto/features/auth/widgets/otp_field_widget.dart';
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
  final otp_form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (authController.loginStep.value == 0) ...{
                            const Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Text("Login",
                                  style: TextStyle(
                                      color: AppColors.titleColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.4)),
                            ),
                            const Text("Please Enter Mobile to continue",
                                style: TextStyle(
                                    color: AppColors.descriptionColorLight,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))
                          }
                        ],
                      ),
                      Form(
                        key: signInFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (authController.loginStep.value == 0) ...{
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 8),
                                child: CustomTextField(
                                    keyboardType: TextInputType.phone,
                                    controller: authController.mobileController,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Enter your Moblie No.';
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
                                padding: const EdgeInsets.only(top: 40),
                                child: CustomButton(
                                  text: "Send OTP",
                                  onPressed: () => {
                                    authController
                                        .onRequestLoginOtp(signInFormKey),
                                  },
                                ),
                              ),
                            } else ...{
                              // otp_field
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Enter The OTP Sent To - ',
                                    style: TextStyle(
                                        color: AppColors.titleColorExtraLight,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        authController.loginStep.value--,
                                    child: Text(
                                      authController
                                          .mobileController.value.text,
                                      style: const TextStyle(
                                          color: AppColors.mainColor,
                                          decoration: TextDecoration.underline,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              OtpFieldWidget(otp_form_key: otp_form_key),
                              Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: CustomButton(
                                    text: "Verify & Login",
                                    onPressed: () {
                                      authController.onVerifyAndLogin(
                                          otp_form_key, context);
                                    },
                                  )),
                              const SizedBox(height: 40),
                              const Center(
                                child: Text(
                                  '01:59',
                                  style: TextStyle(
                                      color: AppColors.titleColorLight,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Haven't Recieved Code ? ",
                                    style: TextStyle(
                                        color: AppColors.titleColorExtraLight,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  GestureDetector(
                                    onTap: () => authController
                                        .onRequestLoginOtp(signInFormKey),
                                    child: const Text(
                                      "Re-Send",
                                      style: TextStyle(
                                          color: AppColors.mainColor,
                                          decoration: TextDecoration.underline,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            }
                          ],
                        ),
                      ),
                      SizedBox(height: 180),
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
          )),
    );
  }
}
