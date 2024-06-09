// // checkbox widget
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/ui/view_model/checkboxfirst/checkboxfirst_bloc.dart';
import 'package:panakj_app/ui/view_model/checkboxsec/checkboxsec_bloc.dart';
import 'package:panakj_app/ui/view_model/checkboxthird/checkboxthird_bloc.dart';


class CheckBoxData1 extends StatefulWidget {
  final bool? initialAlive;
  final bool? initialDisabled;
  final Function(bool, bool) onCheckboxChanged;

  const CheckBoxData1({
    Key? key,
    required this.onCheckboxChanged,
    this.initialAlive,
    this.initialDisabled,
  }) : super(key: key);

  @override
  _CheckBoxData1State createState() => _CheckBoxData1State();
}

class _CheckBoxData1State extends State<CheckBoxData1> {
  late bool isAlive;
  late bool isDisabled;

  @override
  void initState() {
    super.initState();
    // Ensure both checkboxes are unchecked initially if no initial values are provided
    isAlive = widget.initialAlive ?? false;
    isDisabled = widget.initialDisabled ?? false;
  }

  void _updateCheckboxValues() {
    widget.onCheckboxChanged(isAlive, isDisabled);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Alive',
              style: kCardContentStyle,
            ),
            const Spacer(),
            Checkbox(
              value: isAlive,
              onChanged: (value) {
                setState(() {
                  isAlive = value ?? false;
                  _updateCheckboxValues();
                });
              },
            ),
            Text('Yes'),
            const SizedBox(width: 10),
            Checkbox(
              value: !isAlive,
              onChanged: (value) {
                setState(() {
                  isAlive = !(value ?? false);
                  _updateCheckboxValues();
                });
              },
            ),
            Text('No'),
          ],
        ),
        Row(
          children: [
            Text(
              'Disabled/bedridden',
              style: kCardContentStyle,
            ),
            const Spacer(),
            Checkbox(
              value: isDisabled,
              onChanged: (value) {
                setState(() {
                  isDisabled = value ?? false;
                  _updateCheckboxValues();
                });
              },
            ),
            Text('Yes'),
            const SizedBox(width: 10),
            Checkbox(
              value: !isDisabled,
              onChanged: (value) {
                setState(() {
                  isDisabled = !(value ?? false);
                  _updateCheckboxValues();
                });
              },
            ),
            Text('No'),
          ],
        ),
      ],
    );
  }
}
