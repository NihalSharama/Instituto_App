import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:instituto/common/widgets/custom_textfield.dart';

class SignupStep4Student extends StatefulWidget {
  final TextEditingController fathersNameController;
  final TextEditingController mothersNameController;
  final TextEditingController emailController;

  const SignupStep4Student(
      {Key? key,
      required this.fathersNameController,
      required this.mothersNameController,
      required this.emailController})
      : super(key: key);

  @override
  State<SignupStep4Student> createState() => _SignupStep4StudentState();
}

class _SignupStep4StudentState extends State<SignupStep4Student> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: widget.fathersNameController,
          hintText: "Father's Name",
        ),
        CustomTextField(
          controller: widget.mothersNameController,
          hintText: "Mother's Name",
        ),
        CustomTextField(
          controller: widget.emailController,
          hintText: "Your Email",
        ),
      ],
    );
  }
}
