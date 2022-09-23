import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/auth_controllers.dart';
import 'package:instituto/features/auth/services/auth_service.dart';
import 'package:instituto/features/auth/widgets/otp_field_widget.dart';

class SignupStep2PhoneVerify extends StatefulWidget {
  const SignupStep2PhoneVerify({Key? key, required this.signupFormKeys})
      : super(key: key);
  final List<GlobalKey<FormState>> signupFormKeys;

  @override
  State<SignupStep2PhoneVerify> createState() => _SignupStep2PhoneVerifyState();
}

class _SignupStep2PhoneVerifyState extends State<SignupStep2PhoneVerify> {
  final authController = Get.put((AuthController()));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'OTP VERIFICATION',
          style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
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
              onTap: () => authController.currentStep.value--,
              child: Text(
                authController.mobileController.value.text,
                style: const TextStyle(
                    color: AppColors.mainColor,
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        OtpFieldWidget(
          otp_form_key: widget.signupFormKeys[1],
        ),
        const SizedBox(height: 40),
        const Text(
          '01:59',
          style: TextStyle(
              color: AppColors.titleColorLight,
              fontSize: 20,
              fontWeight: FontWeight.w500),
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
              onTap: () {
                AuthServices.request_signup_otp(
                    int.parse(authController.mobileController.text),
                    authController.firstNameController.text,
                    authController.lastNameController.text);
              },
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
        const SizedBox(height: 40),
      ],
    );
  }
}
