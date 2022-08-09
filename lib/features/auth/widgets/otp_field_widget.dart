import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:instituto/constants/global_variables.dart';

class OtpFieldWidget extends StatefulWidget {
  const OtpFieldWidget({Key? key}) : super(key: key);

  @override
  State<OtpFieldWidget> createState() => _OtpFieldWidgetState();
}

class _OtpFieldWidgetState extends State<OtpFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 70,
            child: TextFormField(
              onChanged: (val) {
                if (val.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: TextStyle(height: 1.5, fontSize: 20),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.backgroundGrayExtraLight,
                contentPadding: EdgeInsets.only(top: 30, bottom: 30, left: 30),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const VerticalDivider(
            color: AppColors.backgroundGrayLight,
            thickness: 1.2,
            indent: 10,
            endIndent: 10,
          ),
          SizedBox(
            width: 70,
            child: TextFormField(
              onChanged: (val) {
                if (val.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: TextStyle(height: 1.5, fontSize: 20),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.backgroundGrayExtraLight,
                contentPadding: EdgeInsets.only(top: 30, bottom: 30, left: 30),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const VerticalDivider(
            color: Color.fromARGB(255, 219, 219, 219),
            thickness: 1.2,
            indent: 10,
            endIndent: 10,
          ),
          SizedBox(
            width: 70,
            child: TextFormField(
              onChanged: (val) {
                if (val.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: TextStyle(height: 1.5, fontSize: 20),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.backgroundGrayExtraLight,
                contentPadding: EdgeInsets.only(top: 30, bottom: 30, left: 30),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const VerticalDivider(
            color: AppColors.backgroundGrayLight,
            thickness: 1.2,
            indent: 10,
            endIndent: 10,
          ),
          SizedBox(
            width: 70,
            child: TextFormField(
              onChanged: (val) {
                if (val.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: const TextStyle(height: 1.5, fontSize: 20),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.backgroundGrayExtraLight,
                contentPadding: EdgeInsets.only(top: 30, bottom: 30, left: 30),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
