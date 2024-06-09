import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/ui/view_model/question2_res/question2_res_bloc.dart';






class Question2CheckBox extends StatefulWidget {
  final String option1;
  final String option2;
  final String option3;
  final Function(bool, bool, bool) onChanged;
  final bool initialOption1Value;
  final bool initialOption2Value;
  final bool initialOption3Value;

  const Question2CheckBox({
    Key? key,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.onChanged,
    required this.initialOption1Value,
    required this.initialOption2Value,
    required this.initialOption3Value,
  }) : super(key: key);

  @override
  State<Question2CheckBox> createState() => _Question2CheckBoxState();
}

class _Question2CheckBoxState extends State<Question2CheckBox> {
  late bool option1bool;
  late bool option2bool;
  late bool option3bool;

  @override
  void initState() {
    super.initState();
    option1bool = widget.initialOption1Value;
    option2bool = widget.initialOption2Value;
    option3bool = widget.initialOption3Value;
  }

  @override
  void didUpdateWidget(Question2CheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialOption1Value != widget.initialOption1Value) {
      option1bool = widget.initialOption1Value;
    }
    if (oldWidget.initialOption2Value != widget.initialOption2Value) {
      option2bool = widget.initialOption2Value;
    }
    if (oldWidget.initialOption3Value != widget.initialOption3Value) {
      option3bool = widget.initialOption3Value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: option1bool,
              onChanged: (value) {
                setState(() {
                  option1bool = value!;
                  widget.onChanged(option1bool, option2bool, option3bool);
                });
              },
            ),
            Text(widget.option1, style: checkboxOptionStyle),
            Spacer(),
            Checkbox(
              value: option2bool,
              onChanged: (value) {
                setState(() {
                  option2bool = value!;
                  widget.onChanged(option1bool, option2bool, option3bool);
                });
              },
            ),
            Text(widget.option2, style: checkboxOptionStyle),
            Spacer(),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: option3bool,
              onChanged: (value) {
                setState(() {
                  option3bool = value!;
                  widget.onChanged(option1bool, option2bool, option3bool);
                });
              },
            ),
            Text(widget.option3, style: checkboxOptionStyle),
          ],
        ),
      ],
    );
  }
}











// class Question2CheckBox extends StatefulWidget {
//   final String option1;
//   final String option2;
//   final String option3;
//   final bool initialSheet;
//   final bool initialConcrete;
//   final bool initialTilled;
//   final Function(bool sheet, bool concrete, bool tilled) onChanged;

//   const Question2CheckBox({
//     Key? key,
//     required this.option1,
//     required this.option2,
//     required this.option3,
//     required this.initialSheet,
//     required this.initialConcrete,
//     required this.initialTilled,
//     required this.onChanged,
//   }) : super(key: key);

//   @override
//   State<Question2CheckBox> createState() => _Question2CheckBoxState();
// }

// class _Question2CheckBoxState extends State<Question2CheckBox> {
//   late bool sheet;
//   late bool concrete;
//   late bool tilled;

//   @override
//   void initState() {
//     super.initState();
//     sheet = widget.initialSheet;
//     concrete = widget.initialConcrete;
//     tilled = widget.initialTilled;
//   }

//   @override
//   void didUpdateWidget(Question2CheckBox oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.initialSheet != widget.initialSheet) {
//       sheet = widget.initialSheet;
//     }
//     if (oldWidget.initialConcrete != widget.initialConcrete) {
//       concrete = widget.initialConcrete;
//     }
//     if (oldWidget.initialTilled != widget.initialTilled) {
//       tilled = widget.initialTilled;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Checkbox(
//               value: sheet,
//               onChanged: (value) {
//                 setState(() {
//                   sheet = value ?? false;
//                 });
//                 widget.onChanged(sheet, concrete, tilled);
//               },
//             ),
//             Text(widget.option1, style: checkboxOptionStyle),
//             Spacer(),
//             Checkbox(
//               value: concrete,
//               onChanged: (value) {
//                 setState(() {
//                   concrete = value ?? false;
//                 });
//                 widget.onChanged(sheet, concrete, tilled);
//               },
//             ),
//             Text(widget.option2, style: checkboxOptionStyle),
//             Spacer(),
//           ],
//         ),
//         Row(
//           children: [
//             Checkbox(
//               value: tilled,
//               onChanged: (value) {
//                 setState(() {
//                   tilled = value ?? false;
//                 });
//                 widget.onChanged(sheet, concrete, tilled);
//               },
//             ),
//             Text(widget.option3, style: checkboxOptionStyle),
//           ],
//         ),
//       ],
//     );
//   }
// }
