// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_gallery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetGalleryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getGalleryimage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getGalleryimage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getGalleryimage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetGalleryimage value) getGalleryimage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetGalleryimage value)? getGalleryimage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetGalleryimage value)? getGalleryimage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetGalleryEventCopyWith<$Res> {
  factory $GetGalleryEventCopyWith(
          GetGalleryEvent value, $Res Function(GetGalleryEvent) then) =
      _$GetGalleryEventCopyWithImpl<$Res, GetGalleryEvent>;
}

/// @nodoc
class _$GetGalleryEventCopyWithImpl<$Res, $Val extends GetGalleryEvent>
    implements $GetGalleryEventCopyWith<$Res> {
  _$GetGalleryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetGalleryimageImplCopyWith<$Res> {
  factory _$$GetGalleryimageImplCopyWith(_$GetGalleryimageImpl value,
          $Res Function(_$GetGalleryimageImpl) then) =
      __$$GetGalleryimageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetGalleryimageImplCopyWithImpl<$Res>
    extends _$GetGalleryEventCopyWithImpl<$Res, _$GetGalleryimageImpl>
    implements _$$GetGalleryimageImplCopyWith<$Res> {
  __$$GetGalleryimageImplCopyWithImpl(
      _$GetGalleryimageImpl _value, $Res Function(_$GetGalleryimageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetGalleryimageImpl implements _GetGalleryimage {
  const _$GetGalleryimageImpl();

  @override
  String toString() {
    return 'GetGalleryEvent.getGalleryimage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetGalleryimageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getGalleryimage,
  }) {
    return getGalleryimage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getGalleryimage,
  }) {
    return getGalleryimage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getGalleryimage,
    required TResult orElse(),
  }) {
    if (getGalleryimage != null) {
      return getGalleryimage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetGalleryimage value) getGalleryimage,
  }) {
    return getGalleryimage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetGalleryimage value)? getGalleryimage,
  }) {
    return getGalleryimage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetGalleryimage value)? getGalleryimage,
    required TResult orElse(),
  }) {
    if (getGalleryimage != null) {
      return getGalleryimage(this);
    }
    return orElse();
  }
}

abstract class _GetGalleryimage implements GetGalleryEvent {
  const factory _GetGalleryimage() = _$GetGalleryimageImpl;
}

/// @nodoc
mixin _$GetGalleryState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  EventGallery get gallery => throw _privateConstructorUsedError;
  Option<Either<MainFailure, EventGallery>> get successorFailure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetGalleryStateCopyWith<GetGalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetGalleryStateCopyWith<$Res> {
  factory $GetGalleryStateCopyWith(
          GetGalleryState value, $Res Function(GetGalleryState) then) =
      _$GetGalleryStateCopyWithImpl<$Res, GetGalleryState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      EventGallery gallery,
      Option<Either<MainFailure, EventGallery>> successorFailure});
}

/// @nodoc
class _$GetGalleryStateCopyWithImpl<$Res, $Val extends GetGalleryState>
    implements $GetGalleryStateCopyWith<$Res> {
  _$GetGalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? gallery = null,
    Object? successorFailure = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      gallery: null == gallery
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as EventGallery,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, EventGallery>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GalleryStateImplCopyWith<$Res>
    implements $GetGalleryStateCopyWith<$Res> {
  factory _$$GalleryStateImplCopyWith(
          _$GalleryStateImpl value, $Res Function(_$GalleryStateImpl) then) =
      __$$GalleryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      EventGallery gallery,
      Option<Either<MainFailure, EventGallery>> successorFailure});
}

/// @nodoc
class __$$GalleryStateImplCopyWithImpl<$Res>
    extends _$GetGalleryStateCopyWithImpl<$Res, _$GalleryStateImpl>
    implements _$$GalleryStateImplCopyWith<$Res> {
  __$$GalleryStateImplCopyWithImpl(
      _$GalleryStateImpl _value, $Res Function(_$GalleryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? gallery = null,
    Object? successorFailure = null,
  }) {
    return _then(_$GalleryStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      gallery: null == gallery
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as EventGallery,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, EventGallery>>,
    ));
  }
}

/// @nodoc

class _$GalleryStateImpl implements _GalleryState {
  _$GalleryStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.gallery,
      required this.successorFailure});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final EventGallery gallery;
  @override
  final Option<Either<MainFailure, EventGallery>> successorFailure;

  @override
  String toString() {
    return 'GetGalleryState(isLoading: $isLoading, isError: $isError, gallery: $gallery, successorFailure: $successorFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.gallery, gallery) || other.gallery == gallery) &&
            (identical(other.successorFailure, successorFailure) ||
                other.successorFailure == successorFailure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isError, gallery, successorFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GalleryStateImplCopyWith<_$GalleryStateImpl> get copyWith =>
      __$$GalleryStateImplCopyWithImpl<_$GalleryStateImpl>(this, _$identity);
}

abstract class _GalleryState implements GetGalleryState {
  factory _GalleryState(
      {required final bool isLoading,
      required final bool isError,
      required final EventGallery gallery,
      required final Option<Either<MainFailure, EventGallery>>
          successorFailure}) = _$GalleryStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  EventGallery get gallery;
  @override
  Option<Either<MainFailure, EventGallery>> get successorFailure;
  @override
  @JsonKey(ignore: true)
  _$$GalleryStateImplCopyWith<_$GalleryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
