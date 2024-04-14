// import 'package:flutter/material.dart';
// import 'package:panakj_app/core/constant/constants.dart';

// class MyDropdown extends StatefulWidget {
//    final void Function(String?) onDropdownChanged;
//   const MyDropdown({super.key, required this.onDropdownChanged});

//   @override
//   MyDropdownState createState() => MyDropdownState();
// }

// class MyDropdownState extends State<MyDropdown> {
//   String? _validateDropdown(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please select a query type';
//     }
//     return null;
//   }

//   String? selectedOption1;
//   String? selectedOption2;

//   @override
//   Widget build(BuildContext context) {
//     final deviceWidth = MediaQuery.of(context).size.width;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(
//           height: 58,
//           width: deviceWidth * 0.80,
//           child: DropdownButtonFormField<String>(
//             itemHeight: 58,
//             onChanged: (val) {
//               setState(() {
//                 selectedOption2 = val;
//                  widget.onDropdownChanged(val);
//               });
//             },
//             validator: _validateDropdown,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.only(
//                 left: 10,
//                 right: 5,
//                 bottom: 0,
//                 top: 0,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             focusColor: Colors.white,
//             value: selectedOption1,
//             style: const TextStyle(color: Colors.white, fontSize: 14),
//             iconEnabledColor: Colors.black,
//             items: <String>['Sports', 'Medals', 'Awards', 'Others']
//                 .map<DropdownMenuItem<String>>(
//               (String val) {
//                 return DropdownMenuItem<String>(
//                   value: val,
//                   child: Text(
//                     val,
//                     style: kCardContentStyle,
//                   ),
//                 );
//               },
//             ).toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }




import 'package:flutter/material.dart';

class MyDropdown extends StatefulWidget {
  final String? initialValue;
  final void Function(String?) onDropdownChanged;

  const MyDropdown({Key? key, this.initialValue, required this.onDropdownChanged});

  @override
  MyDropdownState createState() => MyDropdownState();
}

class MyDropdownState extends State<MyDropdown> {
  String? selectedOption;


    @override
  void initState() {
    super.initState();
    selectedOption = widget.initialValue ?? 'No Category'; // Set initial value to 'No Category' if it's null
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 58,
          width: deviceWidth * 0.80,
          child: DropdownButtonFormField(
            itemHeight: 58,
            onChanged: (val) {
              if (val != 'No Category') {
                setState(() {
                  selectedOption = val;
                  widget.onDropdownChanged(val);
                });
              }
            },
            value: selectedOption,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                left: 10,
                right: 5,
                bottom: 0,
                top: 0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            focusColor: Colors.white,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            iconEnabledColor: Colors.black,
            items: [
              DropdownMenuItem<String>(
                value: 'No Category',
                child: Text(
                  'No Category',
                  style: const TextStyle(color: Colors.grey),
                ),
                enabled: false, // Disable the 'No Category' option
              ),
              DropdownMenuItem<String>(
                value: 'Sports',
                child: Text(
                  'Sports',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              DropdownMenuItem<String>(
                value: 'Medals',
                child: Text(
                  'Medals',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              DropdownMenuItem<String>(
                value: 'Awards',
                child: Text(
                  'Awards',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              DropdownMenuItem<String>(
                value: 'Others',
                child: Text(
                  'Others',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

