import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instituto/common/widgets/custom_button.dart';
import 'package:instituto/constants/global_variables.dart';

class TripleSelectionButtons extends StatefulWidget {
  final String title;
  final String field;
  final String firstButtonText;
  final String secondButtonText;
  final String thirdButtonText;
  final VoidCallback? onFirstButtonPress;
  final VoidCallback? onSecondButtonPress;
  final VoidCallback? onThirdButtonPress;
  const TripleSelectionButtons({
    Key? key,
    required this.field,
    required this.firstButtonText,
    required this.secondButtonText,
    required this.thirdButtonText,
    required this.title,
    this.onFirstButtonPress,
    this.onSecondButtonPress,
    this.onThirdButtonPress,
  }) : super(key: key);

  @override
  State<TripleSelectionButtons> createState() => _TripleSelectionButtonsState();
}

class _TripleSelectionButtonsState extends State<TripleSelectionButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.titleColorExtraLight,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 300, bottom: 10, top: 5),
          child: Container(
            height: 2.0,
            color: AppColors.mainColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              onPressed: widget.onFirstButtonPress,
              text: widget.firstButtonText,
              width: 100,
              height: 40,
              elevation: 0,
              color: (widget.field == widget.firstButtonText.toLowerCase()
                  ? AppColors.mainColor
                  : AppColors.backgroundGrayMoreLight),
              textcolor: (widget.field == widget.firstButtonText.toLowerCase()
                  ? Colors.white
                  : AppColors.descriptionColorExtraLight),
            ),
            CustomButton(
              onPressed: widget.onSecondButtonPress,
              text: widget.secondButtonText,
              width: 100,
              height: 40,
              elevation: 0,
              color: (widget.field == widget.secondButtonText.toLowerCase()
                  ? AppColors.mainColor
                  : AppColors.backgroundGrayMoreLight),
              textcolor: (widget.field == widget.secondButtonText.toLowerCase()
                  ? Colors.white
                  : AppColors.descriptionColorExtraLight),
            ),
            CustomButton(
              onPressed: widget.onThirdButtonPress,
              text: widget.thirdButtonText,
              width: 100,
              height: 40,
              elevation: 0,
              color: (widget.field == widget.thirdButtonText.toLowerCase()
                  ? AppColors.mainColor
                  : AppColors.backgroundGrayMoreLight),
              textcolor: (widget.field == widget.thirdButtonText.toLowerCase()
                  ? Colors.white
                  : AppColors.descriptionColorExtraLight),
            )
          ],
        ),
      ],
    );
  }
}
