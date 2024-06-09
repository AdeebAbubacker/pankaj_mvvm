import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/ui/view_model/question3_res/question3_res_bloc.dart';


class Question3CheckBox extends StatefulWidget {
  final String option1;
  final String option2;
  final String option3;
  final Function(bool, bool, bool) onChanged;
  final bool initialOption1Value;
  final bool initialOption2Value;
  final bool initialOption3Value;

  const Question3CheckBox({
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
  State<Question3CheckBox> createState() => _Question3CheckBoxState();
}

class _Question3CheckBoxState extends State<Question3CheckBox> {
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
  void didUpdateWidget(Question3CheckBox oldWidget) {
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









// class Question3CheckBox extends StatefulWidget {
//   final String option1;
//   final String option2;
//   final String option3;
//   final Function(bool, bool, bool) onChanged;
//   final bool initialOption1Value;
//   final bool initialOption2Value;
//   final bool initialOption3Value;

//   const Question3CheckBox({
//     Key? key,
//     required this.option1,
//     required this.option2,
//     required this.option3,
//     required this.onChanged,
//     required this.initialOption1Value,
//     required this.initialOption2Value,
//     required this.initialOption3Value,
//   }) : super(key: key);

//   @override
//   State<Question3CheckBox> createState() => _Question3CheckBoxState();
// }

// class _Question3CheckBoxState extends State<Question3CheckBox> {
//   late bool option1bool;
//   late bool option2bool;
//   late bool option3bool;

//   @override
//   void initState() {
//     super.initState();
//     option1bool = widget.initialOption1Value;
//     option2bool = widget.initialOption2Value;
//     option3bool = widget.initialOption3Value;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Checkbox(
//               value: option1bool,
//               onChanged: (value) {
//                 setState(() {
//                   option1bool = value!;
//                   widget.onChanged(option1bool, option2bool, option3bool);
//                 });
//               },
//             ),
//             Text(widget.option1, style: checkboxOptionStyle),
//             Spacer(),
//             Checkbox(
//               value: option2bool,
//               onChanged: (value) {
//                 setState(() {
//                   option2bool = value!;
//                   widget.onChanged(option1bool, option2bool, option3bool);
//                 });
//               },
//             ),
//             Text(widget.option2, style: checkboxOptionStyle),
//             Spacer(),
//           ],
//         ),
//         Row(
//           children: [
//             Checkbox(
//               value: option3bool,
//               onChanged: (value) {
//                 setState(() {
//                   option3bool = value!;
//                   widget.onChanged(option1bool, option2bool, option3bool);
//                 });
//               },
//             ),
//             Text(widget.option3, style: checkboxOptionStyle),
//           ],
//         )
//       ],
//     );
//   }
// }
