import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/auth_controllers.dart';
import 'package:instituto/features/auth/widgets/otp_field_widget.dart';

class SignupStep2PhoneVerify extends GetView<AuthController> {
  const SignupStep2PhoneVerify({Key? key}) : super(key: key);

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
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              controller.mobileController.value.text,
              style: const TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const OtpFieldWidget(),
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
          children: const [
            Text(
              "Haven't Recieved Code ? ",
              style: TextStyle(
                  color: AppColors.titleColorExtraLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "Re-Send",
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
