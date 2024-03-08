import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/parents_education/parents_education.dart';
import 'package:panakj_app/core/service/get_all_fieldverification_service.dart';

part 'monthly_income_event.dart';
part 'monthly_income_state.dart';
part 'monthly_income_bloc.freezed.dart';

// class MonthlyIncomeBloc extends Bloc<MonthlyIncomeEvent, MonthlyIncomeState> {
//   MonthlyIncomeBloc() : super(_Initial()) {
//     on<MonthlyIncomeEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }


class MonthlyIncomeBloc extends Bloc<MonthlyIncomeEvent, MonthlyIncomeState> {
  final GetAllFieldVerficationService getAllFieldVerficationService;
  MonthlyIncomeBloc(this.getAllFieldVerficationService)
      : super(MonthlyIncomeState.initial()) {
    on<Getmonthlyincome>((event, emit) async {
      emit(
        const MonthlyIncomeState(
            isLoading: true,
            isError: false,
            lifestatus: [],
            successorFailure: None()),
      );
      try {
        final List<FieldVerificationModel> response =
            await getAllFieldVerficationService.monthlyincome();
        print('my applicants are ---------------- ${response.length}');
        emit(MonthlyIncomeState(
          isLoading: false,
          isError: false,
          lifestatus: response,
          successorFailure: optionOf(right(response)),
        ));
        print('success ${response.length}');
      } catch (e) {
        print('Error caught: $e');
        emit(MonthlyIncomeState(
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

