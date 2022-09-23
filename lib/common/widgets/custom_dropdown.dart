import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:multiselect/multiselect.dart';

class CustomDropdown extends StatelessWidget {
  final Function(String?)? onDropdownSelection;
  final List<String> items;
  final String dropDownValue;
  final Color fillColor;
  final Color textColor;
  final double width;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.dropDownValue,
    required this.onDropdownSelection,
    this.fillColor = const Color.fromARGB(255, 231, 231, 231),
    this.textColor = AppColors.descriptionColorExtraLight,
    this.width = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: fillColor),
      child: Center(
        child: DropdownButton(
            borderRadius: BorderRadius.circular(5),
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            dropdownColor: fillColor,
            value: dropDownValue,
            elevation: 0,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 22,
              color: AppColors.descriptionColorExtraLight,
            ),
            items: items.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Center(child: Text(item))),
              );
            }).toList(),
            onChanged: onDropdownSelection),
      ),
    );
  }
}

class CustomSelectionDropdown extends StatelessWidget {
  final Function(List<String>) onChanged;
  final List<String> selectionOptions;
  final List<String> selectedValues;
  final Color fillColor;
  final Color textColor;
  final double width;
  final String hintText;

  const CustomSelectionDropdown({
    Key? key,
    required this.hintText,
    required this.selectionOptions,
    required this.selectedValues,
    required this.onChanged,
    this.fillColor = const Color.fromARGB(255, 231, 231, 231),
    this.textColor = AppColors.descriptionColorExtraLight,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: DropDownMultiSelect(
        icon: const Icon(
          Icons.keyboard_arrow_down,
          size: 22,
          color: AppColors.descriptionColorExtraLight,
        ),
        onChanged: onChanged,
        options: selectionOptions,
        selectedValues: selectedValues,
        hint: Text(
          hintText,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: fillColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
