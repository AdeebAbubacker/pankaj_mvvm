import 'package:flutter/material.dart';
import 'package:panakj_app/core/constant/constants.dart';

class SelectOption extends StatefulWidget {
  final List<String> options;

  const SelectOption({
    Key? key,
    required this.options,
  }) : super(key: key);

  @override
  SelectOptionState createState() => SelectOptionState();
}

class SelectOptionState extends State<SelectOption> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: DropdownButton<String>(
        isExpanded: true,
        hint: const Text(
          'Select one',
          style: homeContentStyle,
        ),
        value: selectedOption,
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              selectedOption = newValue;
            });
          }
        },
        items: widget.options.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(
              option,
              style: homeContentStyle,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
      ),
    );
  }
}
