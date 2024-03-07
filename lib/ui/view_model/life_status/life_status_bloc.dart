import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/life_status/life_status.dart';
import 'package:panakj_app/core/service/school_group_service.dart';

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
        final List<LifeStatus> response =
            await getAllFieldVerficationService.lifeStatus();
        print('my applicants are ---------------- ${response.length}');
        emit(LifeStatusState(
          isLoading: false,
          isError: false,
          lifestatus: response,
          successorFailure: optionOf(right(response)),
        ));
        print('success ${response.length}');
      } catch (e) {
        print('Error caught: $e');
        emit(LifeStatusState(
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
