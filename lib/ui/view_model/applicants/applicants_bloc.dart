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
    emit(const ApplicantsState(
          isLoading: true,
          isError: false,
          applicants: [],
          successorFailure: None()));
      try {
        final List<Applicants> response =
            await applicantService.getAllApplicant();
   emit(ApplicantsState(
          isLoading: false,
          isError: false,
          applicants: response,
          successorFailure: optionOf(right(response)),
        ));
    } catch (e) {
      emit(ApplicantsState(
          isLoading: false,
          isError: true,
          applicants: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
    }
    });
    on<GetcompletedApplicants>((event, emit) async {
  emit(const ApplicantsState(
          isLoading: true,
          isError: false,
          applicants: [],
          successorFailure: None()));
      try {
        final List<Applicants> response =
            await applicantService.applicationCompleted();
       emit(ApplicantsState(
          isLoading: false,
          isError: false,
          applicants: response,
          successorFailure: optionOf(right(response)),
        ));
   } catch (e) {
      emit(ApplicantsState(
          isLoading: false,
          isError: true,
          applicants: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
  }
    });
    on<GetincompletedApplicants>((event, emit) async {
    emit(const ApplicantsState(
          isLoading: true,
          isError: false,
          applicants: [],
          successorFailure: None()));
      try {
        final List<Applicants> response =
            await applicantService.applicationInCompleted();
    emit(ApplicantsState(
          isLoading: false,
          isError: false,
          applicants: response,
          successorFailure: optionOf(right(response)),
        ));
   } catch (e) {
     emit(ApplicantsState(
          isLoading: false,
          isError: true,
          applicants: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
   }
    });
  
  
  }
}
