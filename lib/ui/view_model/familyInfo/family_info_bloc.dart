import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/db/boxes/family_status_box.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/family_data/family_data.dart';
import 'package:panakj_app/core/model/sibling_data/sibling_data.dart';

import 'package:panakj_app/core/service/family_service.dart';
import 'package:panakj_app/core/service/post_personalinfoservice.dart';

part 'family_info_event.dart';
part 'family_info_state.dart';
part 'family_info_bloc.freezed.dart';

class FamilyInfoBloc extends Bloc<FamilyInfoEvent, FamilyInfoState> {
  final FamilyInfoService familyInfoService;
  FamilyInfoBloc(this.familyInfoService) : super(FamilyInfoState.initial()) {
    on<PostFamilyInfo>((event, emit) async {
      try {
        final response = await familyInfoService.postfamilyInfoservice(
          fname: event.fathername,
          falive: event.falive,
          fdisabled: event.fdisabled,
          fincome: event.fincome,
          foccupation: event.focupation,
          mname: event.mathername,
          malive: event.malive,
          mdisabled: event.mdisabled,
          mincome: event.mincome,
          moccupation: event.mocupation,
          gname: event.gathername,
          galive: event.galive,
          gdisabled: event.gdisabled,
          gincome: event.gincome,
          goccupation: event.gocupation,
          SiblingSdtafromHive: event.SiblingsdatafromHive,
        //  SiblingsdatafromHive: event.SiblingsdatafromHive,

          // fathername: event.fathername,
          // falive: event.falive,
          // fdisabled: event.fdisabled,
          // focupation: event.focupation,
          // fincome: event.fincome,
          // frelation: event.frelation,
          // mothername: event.mothername,
          // malive: event.malive,
          // mdisabled: event.mdisabled,
          // mocupation: event.mocupation,
          // mincome: event.mincome,
          // mrelation: event.mrelation,
          // guardainame: event.guardianname,
          // galive: event.galive,
          // gdisabled: event.gdisabled,
          // gocupation: event.gocupation,
          // gincome: event.gincome,
        );
        // final response2 = await familyInfoService.postSiblingsToSupabase(
        //     student_id: event.student_id);
        // await Poststudent1InviteService()
        //     .poststudent1InviteService(id: 9999999, appl_status: '50');
        emit(state.copyWith(
            isLoading: false,
            isError: false,
            successorFailure: optionOf(right(response))));
        print('from bloc file sucess');
      } catch (e) {
        if (e is FormatException) {
          // Handle non-JSON response
          print('Invalid JSON format: $e');
          emit(state.copyWith(
              isLoading: false,
              isError: true,
              successorFailure: optionOf(left(
                  MainFailure.clientFailure(message: 'Invalid JSON format')))));
        } else {
          print('from bloc file errorr');
          emit(state.copyWith(
              isLoading: false,
              isError: true,
              successorFailure: optionOf(
                  left(MainFailure.clientFailure(message: e.toString())))));
        }
      }
    });
  }
}
