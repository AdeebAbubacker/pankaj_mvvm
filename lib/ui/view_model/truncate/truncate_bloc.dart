import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/service/trancate_service.dart';

part 'truncate_event.dart';
part 'truncate_state.dart';
part 'truncate_bloc.freezed.dart';

class TruncateBloc extends Bloc<TruncateEvent, TruncateState> {
  final TruncateService truncateService;
  TruncateBloc(this.truncateService) : super(_Initial()) {
    on<DeleteTable>((event, emit) async{
    
     await truncateService.truncateColleges();
     
    });
  }
}
