import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/applicant_data/applicant_model.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/recipient/recipient.dart';
import 'package:panakj_app/core/service/recepient_service.dart';

part 'recipents_event.dart';
part 'recipents_state.dart';
part 'recipents_bloc.freezed.dart';

class RecipentsBloc extends Bloc<RecipentsEvent, RecipentsState> {
   final RecepientService recepientService;
  RecipentsBloc(this.recepientService) : super(RecipentsState.initial()) {
  
      on<GetallRecipients>((event, emit) async {
      print('eveny');
      emit( RecipentsState(
          isLoading: true,
          isError: false,
          recipients: [],
          successorFailure: None()));
      try {
        final List<Recipient> response =
            await recepientService.recipients();
            print('my applicants are ---------------- ${response.length}');
        emit(RecipentsState(
          isLoading: false,
          isError: false,
          recipients: response,
          successorFailure: optionOf(right(response)),
        ));
        print('success $response');
      } catch (e) {
        print('Error caught: $e');
        emit(RecipentsState(
          isLoading: false,
          isError: true,
          recipients: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
        print('failure from bloc');
      }
    });
  }
}
