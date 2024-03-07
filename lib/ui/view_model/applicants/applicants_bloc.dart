import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/applicant_data/applicant_model.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/service/applicants_service.dart';

part 'applicants_event.dart';
part 'applicants_state.dart';
part 'applicants_bloc.freezed.dart';

class ApplicantsBloc extends Bloc<ApplicantsEvent, ApplicantsState> {
  final ApplicantService applicantService;
  ApplicantsBloc(this.applicantService) : super(ApplicantsState.initial()) {
    on<GetallApplicants>((event, emit) async {
      print('eveny');
      emit(const ApplicantsState(
          isLoading: true,
          isError: false,
          applicants: [],
          successorFailure: None()));
      try {
        final List<Applicants> response =
            await applicantService.getAllApplicant();
            print('my applicants are ---------------- ${response.length}');
        emit(ApplicantsState(
          isLoading: false,
          isError: false,
          applicants: response,
          successorFailure: optionOf(right(response)),
        ));
        print('success $response');
      } catch (e) {
        print('Error caught: $e');
        emit(ApplicantsState(
          isLoading: false,
          isError: true,
          applicants: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
        print('failure from bloc');
      }
    });
    on<GetcompletedApplicants>((event, emit) async {
      print('eveny');
      emit(const ApplicantsState(
          isLoading: true,
          isError: false,
          applicants: [],
          successorFailure: None()));
      try {
        final List<Applicants> response =
            await applicantService.applicationCompleted();
            print('my applicants are ---------------- ${response.length}');
        emit(ApplicantsState(
          isLoading: false,
          isError: false,
          applicants: response,
          successorFailure: optionOf(right(response)),
        ));
        print('success $response');
      } catch (e) {
        print('Error caught: $e');
        emit(ApplicantsState(
          isLoading: false,
          isError: true,
          applicants: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
        print('failure from bloc');
      }
    });
    on<GetincompletedApplicants>((event, emit) async {
      print('eveny');
      emit(const ApplicantsState(
          isLoading: true,
          isError: false,
          applicants: [],
          successorFailure: None()));
      try {
        final List<Applicants> response =
            await applicantService.applicationInCompleted();
            print('my applicants are ---------------- ${response.length}');
        emit(ApplicantsState(
          isLoading: false,
          isError: false,
          applicants: response,
          successorFailure: optionOf(right(response)),
        ));
        print('success $response');
      } catch (e) {
        print('Error caught: $e');
        emit(ApplicantsState(
          isLoading: false,
          isError: true,
          applicants: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
        print('failure from bloc');
      }
    });
  
  
  }
}
