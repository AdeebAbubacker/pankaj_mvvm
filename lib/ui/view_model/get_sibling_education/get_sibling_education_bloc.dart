import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/parents_education/parents_education.dart';
import 'package:panakj_app/core/service/get_all_fieldverification_service.dart';

part 'get_sibling_education_event.dart';
part 'get_sibling_education_state.dart';
part 'get_sibling_education_bloc.freezed.dart';

class GetSiblingEducationBloc
    extends Bloc<GetSiblingEducationEvent, GetSiblingEducationState> {
  final GetAllFieldVerficationService getAllFieldVerficationService;
  GetSiblingEducationBloc(this.getAllFieldVerficationService)
      : super(GetSiblingEducationState.initial()) {
    on<GetSiblingEducation>((event, emit) async {
      emit(
        const GetSiblingEducationState(
            isLoading: true,
            isError: false,
            lifestatus: [],
            successorFailure: None()),
      );
      try {
        final List<FieldVerificationModel> response =
            await getAllFieldVerficationService.getSiblingEducational();
        print('my renatl  source are ---------------- ${response.length}');
        emit(GetSiblingEducationState(
          isLoading: false,
          isError: false,
          lifestatus: response,
          successorFailure: optionOf(right(response)),
        ));
        print('success ${response.length}');
      } catch (e) {
        print('Error caught: $e');
        emit(GetSiblingEducationState(
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
