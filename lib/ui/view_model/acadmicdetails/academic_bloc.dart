import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/academic_data/academic_data.dart';

import 'package:panakj_app/core/model/academic_data_model/academic_data_model.dart';
import 'package:panakj_app/core/model/achievments_data/achievments_data.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/service/academic_service.dart';
import 'package:panakj_app/core/service/post_personalinfoservice.dart';

part 'academic_event.dart';
part 'academic_state.dart';
part 'academic_bloc.freezed.dart';

class AcademicBloc extends Bloc<AcademicEvent, AcademicState> {
  final AcademicService academicService;
  AcademicBloc(this.academicService) : super(AcademicState.initial()) {
    on<postAcademicInfo>((event, emit) async {
      try {
     final response = await academicService.postAcademicService(
          sslcmark: event.sslc.toString(),
          marksplusone: event.plus_one.toString(),
          marksplustwo: event.plus_two.toString(),
          schoolId: event.school.toString(),
          hallTicket: '1234',
          preferredcourse: event.course_pref.toString(),
          achievement: event.achievmentsdatafromHive!,
        );
        // postAcademicService(
        //   // school: event.school,
        //   // reg_no: event.reg_no,
        //   // sslc: event.sslc,
        //   // plus_one: event.plus_one,
        //   // plus_two: event.plus_two,
        //   // course_pref: event.course_pref,
        // );

        emit(state.copyWith(
            isLoading: false,
            isError: false,
            academicData: response,
            successorFailure: optionOf(right(response))));
      } catch (e) {
     emit(state.copyWith(
            isLoading: false,
            isError: true,
            successorFailure: optionOf(
                left(MainFailure.clientFailure(message: e.toString())))));
      }
      await Future.delayed(Duration.zero);
      emit(AcademicState.initial());
    });
  }
}
