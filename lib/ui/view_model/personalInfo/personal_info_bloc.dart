import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/personal_info_data/personal_info_data.dart';

import 'package:panakj_app/core/service/post_personalinfoservice.dart';

part 'personal_info_event.dart';
part 'personal_info_state.dart';
part 'personal_info_bloc.freezed.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  final PostPersonalInfoService postPersonalInfoService;

  PersonalInfoBloc(this.postPersonalInfoService)
      : super(PersonalInfoState.initial()) {
    on<PostPersonalInfo>((event, emit) async {
      try {
 final response = await postPersonalInfoService.postPersonalInfoservice(
          name: event.name,
          gender: event.gender,
          dob: event.dob,
          phone: event.phone,
          address: event.address,
          email: event.email,
          bankAccName: event.bankaccname,
          bankAccNo: event.bankaccno,
          bankId: event.bankid,
          bankIfsc: event.bankifsc,
        );
        
        emit(state.copyWith(
            isLoading: false,
            isError: false,
            successorFailure: optionOf(right(response))));
      } catch (e) {
  emit(state.copyWith(
            isLoading: false,
            isError: true,
            successorFailure: optionOf(
                left(MainFailure.clientFailure(message: e.toString())))));
      }
      await Future.delayed(Duration.zero);
      emit(PersonalInfoState.initial());
    });
  }
}
