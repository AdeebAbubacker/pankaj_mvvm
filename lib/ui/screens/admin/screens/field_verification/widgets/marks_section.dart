import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/marks_details.dart';

class MarksSection extends StatelessWidget {
  const MarksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 30,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              focusNode: FocusNode(),
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              controller: TextEditingController(),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                LengthLimitingTextInputFormatter(7),
                TextInputFormater(decimalDigits: 2, integerDigits: 2),
              ],
              style: kCardContentStyle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
