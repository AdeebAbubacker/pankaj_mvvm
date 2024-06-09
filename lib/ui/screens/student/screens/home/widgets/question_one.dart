import 'package:flutter/material.dart';
import 'package:panakj_app/core/constant/constants.dart';




class Question1CheckBox extends StatefulWidget {
  final Function(bool ownHouse, bool rentalHouse)? onChanged;
  final bool? initialOwnHouse;
  final bool? initialRentalHouse;

  const Question1CheckBox({
    Key? key,
    this.onChanged,
    this.initialOwnHouse,
    this.initialRentalHouse,
  }) : super(key: key);

  @override
  _Question1CheckBoxState createState() => _Question1CheckBoxState();
}

class _Question1CheckBoxState extends State<Question1CheckBox> {
  late bool ownHouse;
  late bool rentalHouse;

  @override
  void initState() {
    super.initState();
    ownHouse = widget.initialOwnHouse ?? false;
    rentalHouse = widget.initialRentalHouse ?? false;
  }

  @override
  void didUpdateWidget(Question1CheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialOwnHouse != widget.initialOwnHouse) {
      ownHouse = widget.initialOwnHouse ?? false;
    }
    if (oldWidget.initialRentalHouse != widget.initialRentalHouse) {
      rentalHouse = widget.initialRentalHouse ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: ownHouse,
          onChanged: (value) {
            setState(() {
              ownHouse = value ?? false;
            });
            widget.onChanged?.call(ownHouse, rentalHouse);
          },
        ),
        const Text('Own House', style: checkboxOptionStyle),
        const Spacer(),
        Checkbox(
          value: rentalHouse,
          onChanged: (value) {
            setState(() {
              rentalHouse = value ?? false;
            });
            widget.onChanged?.call(ownHouse, rentalHouse);
          },
        ),
        const Text('Rental House', style: checkboxOptionStyle),
        const Spacer(),
      ],
    );
  }
}




// class Question1CheckBox extends StatefulWidget {
//   final Function(bool ownHouse, bool rentalHouse)? onChanged;
//   final bool? initialOwnHouse;
//   final bool? initialRentalHouse;

//   const Question1CheckBox({
//     Key? key,
//      this.onChanged,
//      this.initialOwnHouse,
//      this.initialRentalHouse,
//   }) : super(key: key);

//   @override
//   _Question1CheckBoxState createState() => _Question1CheckBoxState();
// }

// class _Question1CheckBoxState extends State<Question1CheckBox> {
//   late bool ownHouse;
//   late bool rentalHouse;

//   @override
//   void initState() {
//     super.initState();
//     ownHouse = widget.initialOwnHouse!;
//     rentalHouse = widget.initialRentalHouse!;
//   }

//   @override
//   void didUpdateWidget(Question1CheckBox oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     ownHouse = widget.initialOwnHouse!;
//     rentalHouse = widget.initialRentalHouse!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Checkbox(
//           value: ownHouse,
//           onChanged: (value) {
//             setState(() {
//               ownHouse = value ?? false;
//             });
//             widget.onChanged!(ownHouse, rentalHouse);
//           },
//         ),
//         const Text('Own House', style: checkboxOptionStyle),
//         const Spacer(),
//         Checkbox(
//           value: rentalHouse,
//           onChanged: (value) {
//             setState(() {
//               rentalHouse = value ?? false;
//             });
//             widget.onChanged!(ownHouse, rentalHouse);
//           },
//         ),
//         const Text('Rental House', style: checkboxOptionStyle),
//         const Spacer(),
//       ],
//     );
//   }
// }
