import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/parents_education/parents_education.dart';
import 'package:panakj_app/core/service/get_all_fieldverification_service.dart';

part 'parents_education_event.dart';
part 'parents_education_state.dart';
part 'parents_education_bloc.freezed.dart';

class ParentsEducationBloc extends Bloc<ParentsEducationEvent, ParentsEducationState> {
    final GetAllFieldVerficationService getAllFieldVerficationService;
  ParentsEducationBloc(this.getAllFieldVerficationService) : super(ParentsEducationState.initial()) {
    // on<Getparentseducation>((event, emit) {
    //   // TODO: implement event handler
    // });


       on<Getparentseducation>((event, emit) async {
      emit(
        const ParentsEducationState(
            isLoading: true,
            isError: false,
            lifestatus: [],
            successorFailure: None()),
      );
      try {
        final List<FieldVerificationModel> response =
            await getAllFieldVerficationService.parentseducation();
        print('my applicants are ---------------- ${response.length}');
        emit(ParentsEducationState(
          isLoading: false,
          isError: false,
          lifestatus: response,
          successorFailure: optionOf(right(response)),
        ));
        print('success ${response.length}');
      } catch (e) {
        print('Error caught: $e');
        emit(ParentsEducationState(
          isLoading: false,
          isError: true,
          lifestatus: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
        print('failure from bloc');
      }
    });
  }
}
