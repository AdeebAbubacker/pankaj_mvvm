import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/parents_education/parents_education.dart';
import 'package:panakj_app/core/service/get_all_fieldverification_service.dart';

part 'get_rental_house_event.dart';
part 'get_rental_house_state.dart';
part 'get_rental_house_bloc.freezed.dart';




class GetRentalHouseBloc extends Bloc<GetRentalHouseEvent, GetRentalHouseState> {
  final GetAllFieldVerficationService getAllFieldVerficationService;
  GetRentalHouseBloc(this.getAllFieldVerficationService)
      : super(GetRentalHouseState.initial()) {
    on<GethouseRental>((event, emit) async {
      emit(
        const GetRentalHouseState(
            isLoading: true,
            isError: false,
            lifestatus: [],
            successorFailure: None()),
      );
      try {
        final List<FieldVerificationModel> response =
            await getAllFieldVerficationService.getrentalHouse();
        print('my renatl  source are ---------------- ${response.length}');
        emit(GetRentalHouseState(
          isLoading: false,
          isError: false,
          lifestatus: response,
          successorFailure: optionOf(right(response)),
        ));
        print('success ${response.length}');
      } catch (e) {
        print('Error caught: $e');
        emit(GetRentalHouseState(
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


