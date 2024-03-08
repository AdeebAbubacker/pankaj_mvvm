part of 'house_plot_size_bloc.dart';

@freezed
class HousePlotSizeEvent with _$HousePlotSizeEvent {
  const factory HousePlotSizeEvent.started() = _Started;
  const factory HousePlotSizeEvent.gethouseplotsize() = Gethouseplotsize;
}