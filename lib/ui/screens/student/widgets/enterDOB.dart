import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/core/db/adapters/personal_info_adapter/personal_info_adapter.dart';



import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:panakj_app/core/constant/constants.dart';

class DOBPicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DOBPicker({Key? key, required this.onDateSelected}) : super(key: key);

  @override
  _DOBPickerState createState() => _DOBPickerState();
}

class _DOBPickerState extends State<DOBPicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now(); // Set _selectedDate to current date
    _retrieveSavedDate();
  }

  Future<void> _retrieveSavedDate() async {
    final box = Hive.box<personalInfoDB>('personalInfoBox');
    final data = box.get(0);
    if (data != null && data.dob != null) {
      setState(() {
        _selectedDate = data.dob;
      });
    }
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.onDateSelected(picked);
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              'Enter Date of Birth',
              style: kCardContentStyle,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => _selectDate(context),
            icon: const Icon(Icons.calendar_today),
          ),
          Text(
            _selectedDate != null ? _formatDate(_selectedDate!) : '',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// class DOBPicker extends StatelessWidget {
//   const DOBPicker({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => DobBloc(),
//       child: BlocBuilder<DobBloc, DobState>(
//         builder: (context, state) {
//           return Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(left: 4),
//                   child: Text(
//                     'Enter Date of Birth',
//                     style: kCardContentStyle,
//                   ),
//                 ),
//                 const Spacer(),
//                 IconButton(
//                   onPressed: () {
//                     BlocProvider.of<DobBloc>(context)
//                         .add(SelectDateEvent(context: context));
//                   },
//                   icon: const Icon(Icons.calendar_today),
//                 ),
//                 Text(
//                   state is DOBSelectedState
//                       ? formatDate(state.selectedDate)
//                       : '',
//                   style: const TextStyle(fontSize: 12),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   String formatDate(DateTime date) {
//     return DateFormat('dd/MM/yyyy').format(date);
//   }
// }
