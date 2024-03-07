// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'life_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LifeStatusEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getlifeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getlifeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getlifeStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetlifeStatus value) getlifeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetlifeStatus value)? getlifeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetlifeStatus value)? getlifeStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LifeStatusEventCopyWith<$Res> {
  factory $LifeStatusEventCopyWith(
          LifeStatusEvent value, $Res Function(LifeStatusEvent) then) =
      _$LifeStatusEventCopyWithImpl<$Res, LifeStatusEvent>;
}

/// @nodoc
class _$LifeStatusEventCopyWithImpl<$Res, $Val extends LifeStatusEvent>
    implements $LifeStatusEventCopyWith<$Res> {
  _$LifeStatusEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$LifeStatusEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'LifeStatusEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getlifeStatus,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getlifeStatus,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getlifeStatus,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetlifeStatus value) getlifeStatus,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetlifeStatus value)? getlifeStatus,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetlifeStatus value)? getlifeStatus,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements LifeStatusEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetlifeStatusImplCopyWith<$Res> {
  factory _$$GetlifeStatusImplCopyWith(
          _$GetlifeStatusImpl value, $Res Function(_$GetlifeStatusImpl) then) =
      __$$GetlifeStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetlifeStatusImplCopyWithImpl<$Res>
    extends _$LifeStatusEventCopyWithImpl<$Res, _$GetlifeStatusImpl>
    implements _$$GetlifeStatusImplCopyWith<$Res> {
  __$$GetlifeStatusImplCopyWithImpl(
      _$GetlifeStatusImpl _value, $Res Function(_$GetlifeStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetlifeStatusImpl implements _GetlifeStatus {
  const _$GetlifeStatusImpl();

  @override
  String toString() {
    return 'LifeStatusEvent.getlifeStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetlifeStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getlifeStatus,
  }) {
    return getlifeStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getlifeStatus,
  }) {
    return getlifeStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getlifeStatus,
    required TResult orElse(),
  }) {
    if (getlifeStatus != null) {
      return getlifeStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetlifeStatus value) getlifeStatus,
  }) {
    return getlifeStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetlifeStatus value)? getlifeStatus,
  }) {
    return getlifeStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetlifeStatus value)? getlifeStatus,
    required TResult orElse(),
  }) {
    if (getlifeStatus != null) {
      return getlifeStatus(this);
    }
    return orElse();
  }
}

abstract class _GetlifeStatus implements LifeStatusEvent {
  const factory _GetlifeStatus() = _$GetlifeStatusImpl;
}

/// @nodoc
mixin _$LifeStatusState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  List<LifeStatus> get lifestatus => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<LifeStatus>>> get successorFailure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LifeStatusStateCopyWith<LifeStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LifeStatusStateCopyWith<$Res> {
  factory $LifeStatusStateCopyWith(
          LifeStatusState value, $Res Function(LifeStatusState) then) =
      _$LifeStatusStateCopyWithImpl<$Res, LifeStatusState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      List<LifeStatus> lifestatus,
      Option<Either<MainFailure, List<LifeStatus>>> successorFailure});
}

/// @nodoc
class _$LifeStatusStateCopyWithImpl<$Res, $Val extends LifeStatusState>
    implements $LifeStatusStateCopyWith<$Res> {
  _$LifeStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? lifestatus = null,
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
      lifestatus: null == lifestatus
          ? _value.lifestatus
          : lifestatus // ignore: cast_nullable_to_non_nullable
              as List<LifeStatus>,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<LifeStatus>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LifeStatusStateImplCopyWith<$Res>
    implements $LifeStatusStateCopyWith<$Res> {
  factory _$$LifeStatusStateImplCopyWith(_$LifeStatusStateImpl value,
          $Res Function(_$LifeStatusStateImpl) then) =
      __$$LifeStatusStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      List<LifeStatus> lifestatus,
      Option<Either<MainFailure, List<LifeStatus>>> successorFailure});
}

/// @nodoc
class __$$LifeStatusStateImplCopyWithImpl<$Res>
    extends _$LifeStatusStateCopyWithImpl<$Res, _$LifeStatusStateImpl>
    implements _$$LifeStatusStateImplCopyWith<$Res> {
  __$$LifeStatusStateImplCopyWithImpl(
      _$LifeStatusStateImpl _value, $Res Function(_$LifeStatusStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? lifestatus = null,
    Object? successorFailure = null,
  }) {
    return _then(_$LifeStatusStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      lifestatus: null == lifestatus
          ? _value._lifestatus
          : lifestatus // ignore: cast_nullable_to_non_nullable
              as List<LifeStatus>,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<LifeStatus>>>,
    ));
  }
}

/// @nodoc

class _$LifeStatusStateImpl implements _LifeStatusState {
  const _$LifeStatusStateImpl(
      {required this.isLoading,
      required this.isError,
      required final List<LifeStatus> lifestatus,
      required this.successorFailure})
      : _lifestatus = lifestatus;

  @override
  final bool isLoading;
  @override
  final bool isError;
  final List<LifeStatus> _lifestatus;
  @override
  List<LifeStatus> get lifestatus {
    if (_lifestatus is EqualUnmodifiableListView) return _lifestatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lifestatus);
  }

  @override
  final Option<Either<MainFailure, List<LifeStatus>>> successorFailure;

  @override
  String toString() {
    return 'LifeStatusState(isLoading: $isLoading, isError: $isError, lifestatus: $lifestatus, successorFailure: $successorFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LifeStatusStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            const DeepCollectionEquality()
                .equals(other._lifestatus, _lifestatus) &&
            (identical(other.successorFailure, successorFailure) ||
                other.successorFailure == successorFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError,
      const DeepCollectionEquality().hash(_lifestatus), successorFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LifeStatusStateImplCopyWith<_$LifeStatusStateImpl> get copyWith =>
      __$$LifeStatusStateImplCopyWithImpl<_$LifeStatusStateImpl>(
          this, _$identity);
}

abstract class _LifeStatusState implements LifeStatusState {
  const factory _LifeStatusState(
      {required final bool isLoading,
      required final bool isError,
      required final List<LifeStatus> lifestatus,
      required final Option<Either<MainFailure, List<LifeStatus>>>
          successorFailure}) = _$LifeStatusStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  List<LifeStatus> get lifestatus;
  @override
  Option<Either<MainFailure, List<LifeStatus>>> get successorFailure;
  @override
  @JsonKey(ignore: true)
  _$$LifeStatusStateImplCopyWith<_$LifeStatusStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
