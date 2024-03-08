import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/parents_education/parents_education.dart';
import 'package:panakj_app/core/service/get_all_fieldverification_service.dart';

part 'house_roof_event.dart';
part 'house_roof_state.dart';
part 'house_roof_bloc.freezed.dart';



class HouseRoofBloc extends Bloc<HouseRoofEvent, HouseRoofState> {
  final GetAllFieldVerficationService getAllFieldVerficationService;
  HouseRoofBloc(this.getAllFieldVerficationService)
      : super(HouseRoofState.initial()) {
    on<Gethouseroof>((event, emit) async {
      emit(
        const HouseRoofState(
            isLoading: true,
            isError: false,
            lifestatus: [],
            successorFailure: None()),
      );
      try {
        final List<FieldVerificationModel> response =
            await getAllFieldVerficationService.houseRoof();
        print('my applicants are ---------------- ${response.length}');
        emit(HouseRoofState(
          isLoading: false,
          isError: false,
          lifestatus: response,
          successorFailure: optionOf(right(response)),
        ));
        print('success ${response.length}');
      } catch (e) {
        print('Error caught: $e');
        emit(HouseRoofState(
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



