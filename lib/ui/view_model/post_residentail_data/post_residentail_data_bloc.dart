import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/db/adapters/validation_residential/validation_residentialadapter.dart';
import 'package:panakj_app/core/db/boxes/validation_residentialBox.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/residential_data/residential_data.dart';
import 'package:panakj_app/core/service/post_personalinfoservice.dart';
import 'package:panakj_app/core/service/residential_service.dart';

part 'post_residentail_data_event.dart';
part 'post_residentail_data_state.dart';
part 'post_residentail_data_bloc.freezed.dart';

class PostResidentailDataBloc
    extends Bloc<PostResidentailDataEvent, PostResidentailDataState> {
  final ResidentialService residentialService;
  PostResidentailDataBloc(this.residentialService)
      : super(PostResidentailDataState.initial()) {
    on<PostResidentailInfo>((event, emit) async {
      try {
        print('-----------------------------------------residential success');
        await validationResidentailBox.put(
          'key',
          ValidationResidentailScreenDB(status: 2),
        );
        final response = await residentialService.postResidentailService(
          houseOwnership: event.houseOwnership,
          housedrinkingwater: event.housedrinkingwater,
          houselandSize: event.houselandSize,
          houseroof: event.houseroof,
        );
        await Poststudent1InviteService()
            .poststudent1InviteService(id: 9999999, appl_status: '100');
        emit(state.copyWith(
            isLoading: false,
            isError: false,
            successorFailure: optionOf(right(response as ResidentialData))));
      } catch (e) {
        await validationResidentailBox.put(
          'key',
          ValidationResidentailScreenDB(status: 2),
        );
        // ignore: avoid_print
        print('----------------------------------------residential failure');
        // ignore: avoid_print
        print('Error: $e'); // Add this line

        emit(state.copyWith(
            isLoading: false,
            isError: true,
            successorFailure: optionOf(
                left(MainFailure.clientFailure(message: e.toString())))));
      }
      await Future.delayed(Duration.zero);
      emit(PostResidentailDataState.initial());
    });
  }
}
