import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String dropDownValue;
  final Function(String?)? onDropdownSelection;
  const CustomDropdown(
      {Key? key,
      required this.items,
      required this.dropDownValue,
      required this.onDropdownSelection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: dropDownValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: onDropdownSelection);
  }
}

class CustomSelectionDropdown extends StatelessWidget {
  const CustomSelectionDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
