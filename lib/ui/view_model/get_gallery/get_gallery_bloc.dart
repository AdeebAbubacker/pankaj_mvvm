import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/event_gallery/event_gallery.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/service/gallery_service.dart';


part 'get_gallery_event.dart';
part 'get_gallery_state.dart';
part 'get_gallery_bloc.freezed.dart';

class GetGalleryBloc extends Bloc<GetGalleryEvent, GetGalleryState> {
  final GalleryService galleryService;
  GetGalleryBloc(this.galleryService) : super(GetGalleryState.initial()) {
    on<_GetGalleryimage>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        // Placeholder for fetching data from the service
        final galleryData = await galleryService.getGalleryData();

        emit(state.copyWith(
            gallery: galleryData,
            isLoading: false,
            successorFailure: optionOf(right(galleryData))));
      } catch (e) {
        // Handle error and update state
        emit(state.copyWith(
            isError: true,
            isLoading: false,
            successorFailure: optionOf(
                left(MainFailure.clientFailure(message: e.toString())))));
      }
    });
  }
}
