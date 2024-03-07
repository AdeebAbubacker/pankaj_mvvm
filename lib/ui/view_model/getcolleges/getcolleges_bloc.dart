import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/get_college_model/college.dart';
import 'package:panakj_app/core/service/get_college_service.dart';

part 'getcolleges_event.dart';
part 'getcolleges_state.dart';
part 'getcolleges_bloc.freezed.dart';

class GetcollegesBloc extends Bloc<GetcollegesEvent, GetcollegesState> {
  final GetCollegeService getCollegeService;

  GetcollegesBloc(this.getCollegeService) : super(GetcollegesState.initial()) {
    on<Getcolleges>((event, emit) async {
      print('eveny');
      emit(const GetcollegesState(
          isLoading: true,
          isError: false,
          college: [],
          successorFailure: None()));
      try {
        final List<College> response = await getCollegeService.getColleges();
        emit(GetcollegesState(
          isLoading: false,
          isError: false,
          college: response,
          successorFailure: optionOf(right(response)),
        ));
        print('success $response');
      } catch (e) {
        print('Error caught: $e');
        emit(GetcollegesState(
          isLoading: false,
          isError: true,
          college: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
        print('failure from bloc');
      }
    });

    on<_EditName>((event, emit) async {
      emit(GetcollegesState(
          isLoading: true,
          isError: false,
          college: [],
          successorFailure: const None()));
      try {
        final response = await getCollegeService.editcollegeName(
            newName: event.newName, selectedItemId: event.collegeId);
        emit(GetcollegesState(
          isLoading: false,
          isError: false,
          college: response,
          successorFailure: optionOf(right(response)),
        ));
      } catch (e) {
        emit(GetcollegesState(
          isLoading: false,
          isError: true,
          college: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
      }
    });
  
  on<_Deletecollege>((event, emit) async {
      emit(const GetcollegesState(
          isLoading: true,
          isError: false,
          college: [],
          successorFailure: None()));
      try {
        final response = await getCollegeService.softDeletecollege(
            selectedItemId: event.collegeId);
        emit(GetcollegesState(
          isLoading: false,
          isError: false,
          college: response,
          successorFailure: optionOf(right(response)),
        ));
      } catch (e) {
        emit(GetcollegesState(
          isLoading: false,
          isError: true,
          college: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
      }
    });
  

      on<_Addcollege>((event, emit) async {
      emit(const GetcollegesState(
          isLoading: true,
          isError: false,
          college: [],
          successorFailure: None()));
      try {
        final response = await getCollegeService.addcollegeName(newName: event.collegename);
        emit(GetcollegesState(
          isLoading: false,
          isError: false,
          college: response,
          successorFailure: optionOf(right(response)),
        ));
      } catch (e) {
        emit(GetcollegesState(
          isLoading: false,
          isError: true,
          college: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
      }
    });
  
  
  }
}
