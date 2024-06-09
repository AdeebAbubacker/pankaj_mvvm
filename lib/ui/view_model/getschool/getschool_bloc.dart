import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import '../../../core/model/get_school_model/school.dart';
import 'package:panakj_app/core/service/get_school_service.dart';
part 'getschool_event.dart';
part 'getschool_state.dart';
part 'getschool_bloc.freezed.dart';

class GetschoolBloc extends Bloc<GetschoolEvent, GetschoolState> {
  final GetSchoolService getSchoolService;

  GetschoolBloc(this.getSchoolService) : super(GetschoolState.initial()) {
    on<Getschool>((event, emit) async {
 emit(GetschoolState(
          isLoading: true,
          isError: false,
          school: [],
          successorFailure: const None()));
      try {
        final List<School> response = await getSchoolService.getSchools();
        emit(GetschoolState(
          isLoading: false,
          isError: false,
          school: response,
          successorFailure: optionOf(right(response)),
        ));
   } catch (e) {
    emit(GetschoolState(
          isLoading: false,
          isError: true,
          school: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
   }
    });
  
    
    on<_EditName>((event, emit) async {
      emit(GetschoolState(
          isLoading: true,
          isError: false,
          school: [],
          successorFailure: const None()));
      try {
        final response = await getSchoolService.editSchoolName(
            newName: event.newName, selectedItemId: event.schoolId);
        emit(GetschoolState(
          isLoading: false,
          isError: false,
          school: response,
          successorFailure: optionOf(right(response)),
        ));
      } catch (e) {
        emit(GetschoolState(
          isLoading: false,
          isError: true,
          school: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
      }
    });
  
  on<_Deleteschool>((event, emit) async {
      emit(const GetschoolState(
          isLoading: true,
          isError: false,
          school: [],
          successorFailure: None()));
      try {
        final response = await getSchoolService.softDeleteSchool(
            selectedItemId: event.schoolId);
        emit(GetschoolState(
          isLoading: false,
          isError: false,
          school: response,
          successorFailure: optionOf(right(response)),
        ));
      } catch (e) {
        emit(GetschoolState(
          isLoading: false,
          isError: true,
          school: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
      }
    });
  

      on<_Addschool>((event, emit) async {
      emit(const GetschoolState(
          isLoading: true,
          isError: false,
          school: [],
          successorFailure: None()));
      try {
        final response = await getSchoolService.addSchoolName(newName: event.schoolname);
        emit(GetschoolState(
          isLoading: false,
          isError: false,
          school: response,
          successorFailure: optionOf(right(response)),
        ));
      } catch (e) {
        emit(GetschoolState(
          isLoading: false,
          isError: true,
          school: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
      }
    });
  }
}
