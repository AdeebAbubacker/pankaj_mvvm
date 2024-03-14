// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_student_invitelist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeleteStudentInvitelistEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String studentId) deleteStudent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String studentId)? deleteStudent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String studentId)? deleteStudent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DeleteStudent value) deleteStudent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DeleteStudent value)? deleteStudent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DeleteStudent value)? deleteStudent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteStudentInvitelistEventCopyWith<$Res> {
  factory $DeleteStudentInvitelistEventCopyWith(
          DeleteStudentInvitelistEvent value,
          $Res Function(DeleteStudentInvitelistEvent) then) =
      _$DeleteStudentInvitelistEventCopyWithImpl<$Res,
          DeleteStudentInvitelistEvent>;
}

/// @nodoc
class _$DeleteStudentInvitelistEventCopyWithImpl<$Res,
        $Val extends DeleteStudentInvitelistEvent>
    implements $DeleteStudentInvitelistEventCopyWith<$Res> {
  _$DeleteStudentInvitelistEventCopyWithImpl(this._value, this._then);

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
    extends _$DeleteStudentInvitelistEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'DeleteStudentInvitelistEvent.started()';
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
    required TResult Function(String studentId) deleteStudent,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String studentId)? deleteStudent,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String studentId)? deleteStudent,
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
    required TResult Function(_DeleteStudent value) deleteStudent,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DeleteStudent value)? deleteStudent,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DeleteStudent value)? deleteStudent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements DeleteStudentInvitelistEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$DeleteStudentImplCopyWith<$Res> {
  factory _$$DeleteStudentImplCopyWith(
          _$DeleteStudentImpl value, $Res Function(_$DeleteStudentImpl) then) =
      __$$DeleteStudentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String studentId});
}

/// @nodoc
class __$$DeleteStudentImplCopyWithImpl<$Res>
    extends _$DeleteStudentInvitelistEventCopyWithImpl<$Res,
        _$DeleteStudentImpl> implements _$$DeleteStudentImplCopyWith<$Res> {
  __$$DeleteStudentImplCopyWithImpl(
      _$DeleteStudentImpl _value, $Res Function(_$DeleteStudentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
  }) {
    return _then(_$DeleteStudentImpl(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteStudentImpl implements _DeleteStudent {
  const _$DeleteStudentImpl({required this.studentId});

  @override
  final String studentId;

  @override
  String toString() {
    return 'DeleteStudentInvitelistEvent.deleteStudent(studentId: $studentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteStudentImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, studentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteStudentImplCopyWith<_$DeleteStudentImpl> get copyWith =>
      __$$DeleteStudentImplCopyWithImpl<_$DeleteStudentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String studentId) deleteStudent,
  }) {
    return deleteStudent(studentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String studentId)? deleteStudent,
  }) {
    return deleteStudent?.call(studentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String studentId)? deleteStudent,
    required TResult orElse(),
  }) {
    if (deleteStudent != null) {
      return deleteStudent(studentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DeleteStudent value) deleteStudent,
  }) {
    return deleteStudent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DeleteStudent value)? deleteStudent,
  }) {
    return deleteStudent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DeleteStudent value)? deleteStudent,
    required TResult orElse(),
  }) {
    if (deleteStudent != null) {
      return deleteStudent(this);
    }
    return orElse();
  }
}

abstract class _DeleteStudent implements DeleteStudentInvitelistEvent {
  const factory _DeleteStudent({required final String studentId}) =
      _$DeleteStudentImpl;

  String get studentId;
  @JsonKey(ignore: true)
  _$$DeleteStudentImplCopyWith<_$DeleteStudentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeleteStudentInvitelistState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  DeleteStudentInviteList get createNewInvitedStudent =>
      throw _privateConstructorUsedError;
  Option<Either<MainFailure, DeleteStudentInviteList>> get successorFailure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeleteStudentInvitelistStateCopyWith<DeleteStudentInvitelistState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteStudentInvitelistStateCopyWith<$Res> {
  factory $DeleteStudentInvitelistStateCopyWith(
          DeleteStudentInvitelistState value,
          $Res Function(DeleteStudentInvitelistState) then) =
      _$DeleteStudentInvitelistStateCopyWithImpl<$Res,
          DeleteStudentInvitelistState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      DeleteStudentInviteList createNewInvitedStudent,
      Option<Either<MainFailure, DeleteStudentInviteList>> successorFailure});
}

/// @nodoc
class _$DeleteStudentInvitelistStateCopyWithImpl<$Res,
        $Val extends DeleteStudentInvitelistState>
    implements $DeleteStudentInvitelistStateCopyWith<$Res> {
  _$DeleteStudentInvitelistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? createNewInvitedStudent = null,
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
      createNewInvitedStudent: null == createNewInvitedStudent
          ? _value.createNewInvitedStudent
          : createNewInvitedStudent // ignore: cast_nullable_to_non_nullable
              as DeleteStudentInviteList,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, DeleteStudentInviteList>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteStudentInvitelistStateImplCopyWith<$Res>
    implements $DeleteStudentInvitelistStateCopyWith<$Res> {
  factory _$$DeleteStudentInvitelistStateImplCopyWith(
          _$DeleteStudentInvitelistStateImpl value,
          $Res Function(_$DeleteStudentInvitelistStateImpl) then) =
      __$$DeleteStudentInvitelistStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      DeleteStudentInviteList createNewInvitedStudent,
      Option<Either<MainFailure, DeleteStudentInviteList>> successorFailure});
}

/// @nodoc
class __$$DeleteStudentInvitelistStateImplCopyWithImpl<$Res>
    extends _$DeleteStudentInvitelistStateCopyWithImpl<$Res,
        _$DeleteStudentInvitelistStateImpl>
    implements _$$DeleteStudentInvitelistStateImplCopyWith<$Res> {
  __$$DeleteStudentInvitelistStateImplCopyWithImpl(
      _$DeleteStudentInvitelistStateImpl _value,
      $Res Function(_$DeleteStudentInvitelistStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? createNewInvitedStudent = null,
    Object? successorFailure = null,
  }) {
    return _then(_$DeleteStudentInvitelistStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      createNewInvitedStudent: null == createNewInvitedStudent
          ? _value.createNewInvitedStudent
          : createNewInvitedStudent // ignore: cast_nullable_to_non_nullable
              as DeleteStudentInviteList,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, DeleteStudentInviteList>>,
    ));
  }
}

/// @nodoc

class _$DeleteStudentInvitelistStateImpl
    implements _DeleteStudentInvitelistState {
  _$DeleteStudentInvitelistStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.createNewInvitedStudent,
      required this.successorFailure});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final DeleteStudentInviteList createNewInvitedStudent;
  @override
  final Option<Either<MainFailure, DeleteStudentInviteList>> successorFailure;

  @override
  String toString() {
    return 'DeleteStudentInvitelistState(isLoading: $isLoading, isError: $isError, createNewInvitedStudent: $createNewInvitedStudent, successorFailure: $successorFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteStudentInvitelistStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(
                    other.createNewInvitedStudent, createNewInvitedStudent) ||
                other.createNewInvitedStudent == createNewInvitedStudent) &&
            (identical(other.successorFailure, successorFailure) ||
                other.successorFailure == successorFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError,
      createNewInvitedStudent, successorFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteStudentInvitelistStateImplCopyWith<
          _$DeleteStudentInvitelistStateImpl>
      get copyWith => __$$DeleteStudentInvitelistStateImplCopyWithImpl<
          _$DeleteStudentInvitelistStateImpl>(this, _$identity);
}

abstract class _DeleteStudentInvitelistState
    implements DeleteStudentInvitelistState {
  factory _DeleteStudentInvitelistState(
      {required final bool isLoading,
      required final bool isError,
      required final DeleteStudentInviteList createNewInvitedStudent,
      required final Option<Either<MainFailure, DeleteStudentInviteList>>
          successorFailure}) = _$DeleteStudentInvitelistStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  DeleteStudentInviteList get createNewInvitedStudent;
  @override
  Option<Either<MainFailure, DeleteStudentInviteList>> get successorFailure;
  @override
  @JsonKey(ignore: true)
  _$$DeleteStudentInvitelistStateImplCopyWith<
          _$DeleteStudentInvitelistStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
