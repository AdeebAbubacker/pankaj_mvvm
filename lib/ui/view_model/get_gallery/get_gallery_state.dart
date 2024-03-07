part of 'get_gallery_bloc.dart';

@freezed
class GetGalleryState with _$GetGalleryState {
  factory GetGalleryState.initial() {
    return  GetGalleryState(
      isLoading: false,
      isError: false,
      gallery: EventGallery(), // Assuming you have a default constructor for EventGallery
      successorFailure: None(),
    );
  }

  factory GetGalleryState({
    required bool isLoading,
    required bool isError,
    required EventGallery gallery,
    required Option<Either<MainFailure, EventGallery>> successorFailure,
  }) = _GalleryState;
}


