import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:panakj_app/core/db/boxes/cache_screen1_box.dart';

part 'students_app_form_event.dart';
part 'students_app_form_state.dart';

// class StudentsAppFormBloc
//     extends Bloc<StudentsAppFormEvent, StudentsAppFormState> {
//   StudentsAppFormBloc()
//       : super(const StudentsAppFormState(
//             forBankAccountholder: false, forNoAccountUsers: false,currentStep: 0)) {
//     on<DoYouHaveBankAccEvent>((event, emit) async {
//       emit( StudentsAppFormState(
//           forBankAccountholder: true, forNoAccountUsers: false,currentStep: event.currentStep));
//     });

//     on<ForNoAccBankAccEvent>((event, emit) async {
//       emit(const StudentsAppFormState(
//           forBankAccountholder: false, forNoAccountUsers: true));
//     });
//     // on<NextStepEvent>((event, emit) {
//     //   emit(NextandPrevState(currentStep: 0));
//     // });
//   }
// }




class StudentsAppFormBloc
    extends Bloc<StudentsAppFormEvent, StudentsAppFormState> {
  StudentsAppFormBloc()
      : super(const StudentsAppFormState(
            forBankAccountholder: false, forNoAccountUsers: false, currentStep: 0)) {
    on<DoYouHaveBankAccEvent>((event, emit) async {
      emit(StudentsAppFormState(
          forBankAccountholder: true, forNoAccountUsers: false, currentStep: event.currentStep));

      // Load data from Hive after the state change
      _loadDataFromHive();
    });

    on<ForNoAccBankAccEvent>((event, emit) async {
      emit(const StudentsAppFormState(
          forBankAccountholder: false, forNoAccountUsers: true));

      // Load data from Hive after the state change
      _loadDataFromHive();
    });

  
  }

  void _loadDataFromHive() {
    final personalInfo = cachescreen1box.get(1);
    if (personalInfo != null) {
      personalInfo.ownhouse;

      // Check bankstatus and update forBankAccountholder accordingly
      if (personalInfo.bankaccstatus == true) {
        emit(StudentsAppFormState(forBankAccountholder: true,forNoAccountUsers: false));
      }else{
        
      }
    }
  }
}
