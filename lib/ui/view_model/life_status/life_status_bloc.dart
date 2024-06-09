import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/parents_education/parents_education.dart';
import 'package:panakj_app/core/service/get_all_fieldverification_service.dart';

part 'life_status_event.dart';
part 'life_status_state.dart';
part 'life_status_bloc.freezed.dart';

class LifeStatusBloc extends Bloc<LifeStatusEvent, LifeStatusState> {
  final GetAllFieldVerficationService getAllFieldVerficationService;
  LifeStatusBloc(this.getAllFieldVerficationService)
      : super(LifeStatusState.initial()) {
    on<_GetlifeStatus>((event, emit) async {
      emit(
        const LifeStatusState(
            isLoading: true,
            isError: false,
            lifestatus: [],
            successorFailure: None()),
      );
      try {
        final List<FieldVerificationModel> response =
            await getAllFieldVerficationService.lifeStatus();
   emit(LifeStatusState(
          isLoading: false,
          isError: false,
          lifestatus: response,
          successorFailure: optionOf(right(response)),
        ));
  } catch (e) {
    emit(LifeStatusState(
          isLoading: false,
          isError: true,
          lifestatus: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
  }
    });
  }
}
