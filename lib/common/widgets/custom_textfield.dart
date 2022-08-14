import 'package:flutter/material.dart';
import 'package:instituto/constants/global_variables.dart';
// import 'package:form_field_validator/form_field_validator.dart';

class CustomTextField extends StatelessWidget {
  final FormFieldValidator validator;
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final Color fillColor;
  final Color textColor;
  final double paddingTop;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.maxLines = 1,
    this.fillColor = AppColors.backgroundGrayExtraLight,
    this.textColor = AppColors.descriptionColorExtraLight,
    this.paddingTop = 8,
  }) : super(key: key);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Form(
        key: _formkey,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor,
            hintText: hintText,
            hintStyle: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
            contentPadding:
                EdgeInsets.only(left: 20.0, bottom: 8.0, top: paddingTop),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          validator: validator,
        ),
      ),
    );
  }
}
