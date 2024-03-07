// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'getschool_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetschoolEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getschool,
    required TResult Function(int schoolId, String newName) editName,
    required TResult Function(int schoolId) deleteschool,
    required TResult Function(String schoolname) addschool,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getschool,
    TResult? Function(int schoolId, String newName)? editName,
    TResult? Function(int schoolId)? deleteschool,
    TResult? Function(String schoolname)? addschool,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getschool,
    TResult Function(int schoolId, String newName)? editName,
    TResult Function(int schoolId)? deleteschool,
    TResult Function(String schoolname)? addschool,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(Getschool value) getschool,
    required TResult Function(_EditName value) editName,
    required TResult Function(_Deleteschool value) deleteschool,
    required TResult Function(_Addschool value) addschool,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(Getschool value)? getschool,
    TResult? Function(_EditName value)? editName,
    TResult? Function(_Deleteschool value)? deleteschool,
    TResult? Function(_Addschool value)? addschool,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(Getschool value)? getschool,
    TResult Function(_EditName value)? editName,
    TResult Function(_Deleteschool value)? deleteschool,
    TResult Function(_Addschool value)? addschool,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetschoolEventCopyWith<$Res> {
  factory $GetschoolEventCopyWith(
          GetschoolEvent value, $Res Function(GetschoolEvent) then) =
      _$GetschoolEventCopyWithImpl<$Res, GetschoolEvent>;
}

/// @nodoc
class _$GetschoolEventCopyWithImpl<$Res, $Val extends GetschoolEvent>
    implements $GetschoolEventCopyWith<$Res> {
  _$GetschoolEventCopyWithImpl(this._value, this._then);

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
    extends _$GetschoolEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'GetschoolEvent.started()';
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
    required TResult Function() getschool,
    required TResult Function(int schoolId, String newName) editName,
    required TResult Function(int schoolId) deleteschool,
    required TResult Function(String schoolname) addschool,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getschool,
    TResult? Function(int schoolId, String newName)? editName,
    TResult? Function(int schoolId)? deleteschool,
    TResult? Function(String schoolname)? addschool,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getschool,
    TResult Function(int schoolId, String newName)? editName,
    TResult Function(int schoolId)? deleteschool,
    TResult Function(String schoolname)? addschool,
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
    required TResult Function(Getschool value) getschool,
    required TResult Function(_EditName value) editName,
    required TResult Function(_Deleteschool value) deleteschool,
    required TResult Function(_Addschool value) addschool,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(Getschool value)? getschool,
    TResult? Function(_EditName value)? editName,
    TResult? Function(_Deleteschool value)? deleteschool,
    TResult? Function(_Addschool value)? addschool,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(Getschool value)? getschool,
    TResult Function(_EditName value)? editName,
    TResult Function(_Deleteschool value)? deleteschool,
    TResult Function(_Addschool value)? addschool,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GetschoolEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetschoolImplCopyWith<$Res> {
  factory _$$GetschoolImplCopyWith(
          _$GetschoolImpl value, $Res Function(_$GetschoolImpl) then) =
      __$$GetschoolImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetschoolImplCopyWithImpl<$Res>
    extends _$GetschoolEventCopyWithImpl<$Res, _$GetschoolImpl>
    implements _$$GetschoolImplCopyWith<$Res> {
  __$$GetschoolImplCopyWithImpl(
      _$GetschoolImpl _value, $Res Function(_$GetschoolImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetschoolImpl implements Getschool {
  const _$GetschoolImpl();

  @override
  String toString() {
    return 'GetschoolEvent.getschool()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetschoolImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getschool,
    required TResult Function(int schoolId, String newName) editName,
    required TResult Function(int schoolId) deleteschool,
    required TResult Function(String schoolname) addschool,
  }) {
    return getschool();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getschool,
    TResult? Function(int schoolId, String newName)? editName,
    TResult? Function(int schoolId)? deleteschool,
    TResult? Function(String schoolname)? addschool,
  }) {
    return getschool?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getschool,
    TResult Function(int schoolId, String newName)? editName,
    TResult Function(int schoolId)? deleteschool,
    TResult Function(String schoolname)? addschool,
    required TResult orElse(),
  }) {
    if (getschool != null) {
      return getschool();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(Getschool value) getschool,
    required TResult Function(_EditName value) editName,
    required TResult Function(_Deleteschool value) deleteschool,
    required TResult Function(_Addschool value) addschool,
  }) {
    return getschool(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(Getschool value)? getschool,
    TResult? Function(_EditName value)? editName,
    TResult? Function(_Deleteschool value)? deleteschool,
    TResult? Function(_Addschool value)? addschool,
  }) {
    return getschool?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(Getschool value)? getschool,
    TResult Function(_EditName value)? editName,
    TResult Function(_Deleteschool value)? deleteschool,
    TResult Function(_Addschool value)? addschool,
    required TResult orElse(),
  }) {
    if (getschool != null) {
      return getschool(this);
    }
    return orElse();
  }
}

abstract class Getschool implements GetschoolEvent {
  const factory Getschool() = _$GetschoolImpl;
}

/// @nodoc
abstract class _$$EditNameImplCopyWith<$Res> {
  factory _$$EditNameImplCopyWith(
          _$EditNameImpl value, $Res Function(_$EditNameImpl) then) =
      __$$EditNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int schoolId, String newName});
}

/// @nodoc
class __$$EditNameImplCopyWithImpl<$Res>
    extends _$GetschoolEventCopyWithImpl<$Res, _$EditNameImpl>
    implements _$$EditNameImplCopyWith<$Res> {
  __$$EditNameImplCopyWithImpl(
      _$EditNameImpl _value, $Res Function(_$EditNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schoolId = null,
    Object? newName = null,
  }) {
    return _then(_$EditNameImpl(
      schoolId: null == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int,
      newName: null == newName
          ? _value.newName
          : newName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditNameImpl implements _EditName {
  const _$EditNameImpl({required this.schoolId, required this.newName});

  @override
  final int schoolId;
  @override
  final String newName;

  @override
  String toString() {
    return 'GetschoolEvent.editName(schoolId: $schoolId, newName: $newName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditNameImpl &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId) &&
            (identical(other.newName, newName) || other.newName == newName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schoolId, newName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditNameImplCopyWith<_$EditNameImpl> get copyWith =>
      __$$EditNameImplCopyWithImpl<_$EditNameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getschool,
    required TResult Function(int schoolId, String newName) editName,
    required TResult Function(int schoolId) deleteschool,
    required TResult Function(String schoolname) addschool,
  }) {
    return editName(schoolId, newName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getschool,
    TResult? Function(int schoolId, String newName)? editName,
    TResult? Function(int schoolId)? deleteschool,
    TResult? Function(String schoolname)? addschool,
  }) {
    return editName?.call(schoolId, newName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getschool,
    TResult Function(int schoolId, String newName)? editName,
    TResult Function(int schoolId)? deleteschool,
    TResult Function(String schoolname)? addschool,
    required TResult orElse(),
  }) {
    if (editName != null) {
      return editName(schoolId, newName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(Getschool value) getschool,
    required TResult Function(_EditName value) editName,
    required TResult Function(_Deleteschool value) deleteschool,
    required TResult Function(_Addschool value) addschool,
  }) {
    return editName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(Getschool value)? getschool,
    TResult? Function(_EditName value)? editName,
    TResult? Function(_Deleteschool value)? deleteschool,
    TResult? Function(_Addschool value)? addschool,
  }) {
    return editName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(Getschool value)? getschool,
    TResult Function(_EditName value)? editName,
    TResult Function(_Deleteschool value)? deleteschool,
    TResult Function(_Addschool value)? addschool,
    required TResult orElse(),
  }) {
    if (editName != null) {
      return editName(this);
    }
    return orElse();
  }
}

abstract class _EditName implements GetschoolEvent {
  const factory _EditName(
      {required final int schoolId,
      required final String newName}) = _$EditNameImpl;

  int get schoolId;
  String get newName;
  @JsonKey(ignore: true)
  _$$EditNameImplCopyWith<_$EditNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteschoolImplCopyWith<$Res> {
  factory _$$DeleteschoolImplCopyWith(
          _$DeleteschoolImpl value, $Res Function(_$DeleteschoolImpl) then) =
      __$$DeleteschoolImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int schoolId});
}

/// @nodoc
class __$$DeleteschoolImplCopyWithImpl<$Res>
    extends _$GetschoolEventCopyWithImpl<$Res, _$DeleteschoolImpl>
    implements _$$DeleteschoolImplCopyWith<$Res> {
  __$$DeleteschoolImplCopyWithImpl(
      _$DeleteschoolImpl _value, $Res Function(_$DeleteschoolImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schoolId = null,
  }) {
    return _then(_$DeleteschoolImpl(
      schoolId: null == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteschoolImpl implements _Deleteschool {
  const _$DeleteschoolImpl({required this.schoolId});

  @override
  final int schoolId;

  @override
  String toString() {
    return 'GetschoolEvent.deleteschool(schoolId: $schoolId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteschoolImpl &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schoolId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteschoolImplCopyWith<_$DeleteschoolImpl> get copyWith =>
      __$$DeleteschoolImplCopyWithImpl<_$DeleteschoolImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getschool,
    required TResult Function(int schoolId, String newName) editName,
    required TResult Function(int schoolId) deleteschool,
    required TResult Function(String schoolname) addschool,
  }) {
    return deleteschool(schoolId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getschool,
    TResult? Function(int schoolId, String newName)? editName,
    TResult? Function(int schoolId)? deleteschool,
    TResult? Function(String schoolname)? addschool,
  }) {
    return deleteschool?.call(schoolId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getschool,
    TResult Function(int schoolId, String newName)? editName,
    TResult Function(int schoolId)? deleteschool,
    TResult Function(String schoolname)? addschool,
    required TResult orElse(),
  }) {
    if (deleteschool != null) {
      return deleteschool(schoolId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(Getschool value) getschool,
    required TResult Function(_EditName value) editName,
    required TResult Function(_Deleteschool value) deleteschool,
    required TResult Function(_Addschool value) addschool,
  }) {
    return deleteschool(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(Getschool value)? getschool,
    TResult? Function(_EditName value)? editName,
    TResult? Function(_Deleteschool value)? deleteschool,
    TResult? Function(_Addschool value)? addschool,
  }) {
    return deleteschool?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(Getschool value)? getschool,
    TResult Function(_EditName value)? editName,
    TResult Function(_Deleteschool value)? deleteschool,
    TResult Function(_Addschool value)? addschool,
    required TResult orElse(),
  }) {
    if (deleteschool != null) {
      return deleteschool(this);
    }
    return orElse();
  }
}

abstract class _Deleteschool implements GetschoolEvent {
  const factory _Deleteschool({required final int schoolId}) =
      _$DeleteschoolImpl;

  int get schoolId;
  @JsonKey(ignore: true)
  _$$DeleteschoolImplCopyWith<_$DeleteschoolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddschoolImplCopyWith<$Res> {
  factory _$$AddschoolImplCopyWith(
          _$AddschoolImpl value, $Res Function(_$AddschoolImpl) then) =
      __$$AddschoolImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String schoolname});
}

/// @nodoc
class __$$AddschoolImplCopyWithImpl<$Res>
    extends _$GetschoolEventCopyWithImpl<$Res, _$AddschoolImpl>
    implements _$$AddschoolImplCopyWith<$Res> {
  __$$AddschoolImplCopyWithImpl(
      _$AddschoolImpl _value, $Res Function(_$AddschoolImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schoolname = null,
  }) {
    return _then(_$AddschoolImpl(
      schoolname: null == schoolname
          ? _value.schoolname
          : schoolname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddschoolImpl implements _Addschool {
  const _$AddschoolImpl({required this.schoolname});

  @override
  final String schoolname;

  @override
  String toString() {
    return 'GetschoolEvent.addschool(schoolname: $schoolname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddschoolImpl &&
            (identical(other.schoolname, schoolname) ||
                other.schoolname == schoolname));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schoolname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddschoolImplCopyWith<_$AddschoolImpl> get copyWith =>
      __$$AddschoolImplCopyWithImpl<_$AddschoolImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getschool,
    required TResult Function(int schoolId, String newName) editName,
    required TResult Function(int schoolId) deleteschool,
    required TResult Function(String schoolname) addschool,
  }) {
    return addschool(schoolname);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getschool,
    TResult? Function(int schoolId, String newName)? editName,
    TResult? Function(int schoolId)? deleteschool,
    TResult? Function(String schoolname)? addschool,
  }) {
    return addschool?.call(schoolname);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getschool,
    TResult Function(int schoolId, String newName)? editName,
    TResult Function(int schoolId)? deleteschool,
    TResult Function(String schoolname)? addschool,
    required TResult orElse(),
  }) {
    if (addschool != null) {
      return addschool(schoolname);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(Getschool value) getschool,
    required TResult Function(_EditName value) editName,
    required TResult Function(_Deleteschool value) deleteschool,
    required TResult Function(_Addschool value) addschool,
  }) {
    return addschool(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(Getschool value)? getschool,
    TResult? Function(_EditName value)? editName,
    TResult? Function(_Deleteschool value)? deleteschool,
    TResult? Function(_Addschool value)? addschool,
  }) {
    return addschool?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(Getschool value)? getschool,
    TResult Function(_EditName value)? editName,
    TResult Function(_Deleteschool value)? deleteschool,
    TResult Function(_Addschool value)? addschool,
    required TResult orElse(),
  }) {
    if (addschool != null) {
      return addschool(this);
    }
    return orElse();
  }
}

abstract class _Addschool implements GetschoolEvent {
  const factory _Addschool({required final String schoolname}) =
      _$AddschoolImpl;

  String get schoolname;
  @JsonKey(ignore: true)
  _$$AddschoolImplCopyWith<_$AddschoolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetschoolState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  List<School> get school => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<School>>> get successorFailure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetschoolStateCopyWith<GetschoolState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetschoolStateCopyWith<$Res> {
  factory $GetschoolStateCopyWith(
          GetschoolState value, $Res Function(GetschoolState) then) =
      _$GetschoolStateCopyWithImpl<$Res, GetschoolState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      List<School> school,
      Option<Either<MainFailure, List<School>>> successorFailure});
}

/// @nodoc
class _$GetschoolStateCopyWithImpl<$Res, $Val extends GetschoolState>
    implements $GetschoolStateCopyWith<$Res> {
  _$GetschoolStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? school = null,
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
      school: null == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as List<School>,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<School>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetschoolStateImplCopyWith<$Res>
    implements $GetschoolStateCopyWith<$Res> {
  factory _$$GetschoolStateImplCopyWith(_$GetschoolStateImpl value,
          $Res Function(_$GetschoolStateImpl) then) =
      __$$GetschoolStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      List<School> school,
      Option<Either<MainFailure, List<School>>> successorFailure});
}

/// @nodoc
class __$$GetschoolStateImplCopyWithImpl<$Res>
    extends _$GetschoolStateCopyWithImpl<$Res, _$GetschoolStateImpl>
    implements _$$GetschoolStateImplCopyWith<$Res> {
  __$$GetschoolStateImplCopyWithImpl(
      _$GetschoolStateImpl _value, $Res Function(_$GetschoolStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? school = null,
    Object? successorFailure = null,
  }) {
    return _then(_$GetschoolStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      school: null == school
          ? _value._school
          : school // ignore: cast_nullable_to_non_nullable
              as List<School>,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<School>>>,
    ));
  }
}

/// @nodoc

class _$GetschoolStateImpl implements _GetschoolState {
  const _$GetschoolStateImpl(
      {required this.isLoading,
      required this.isError,
      required final List<School> school,
      required this.successorFailure})
      : _school = school;

  @override
  final bool isLoading;
  @override
  final bool isError;
  final List<School> _school;
  @override
  List<School> get school {
    if (_school is EqualUnmodifiableListView) return _school;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_school);
  }

  @override
  final Option<Either<MainFailure, List<School>>> successorFailure;

  @override
  String toString() {
    return 'GetschoolState(isLoading: $isLoading, isError: $isError, school: $school, successorFailure: $successorFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetschoolStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            const DeepCollectionEquality().equals(other._school, _school) &&
            (identical(other.successorFailure, successorFailure) ||
                other.successorFailure == successorFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError,
      const DeepCollectionEquality().hash(_school), successorFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetschoolStateImplCopyWith<_$GetschoolStateImpl> get copyWith =>
      __$$GetschoolStateImplCopyWithImpl<_$GetschoolStateImpl>(
          this, _$identity);
}

abstract class _GetschoolState implements GetschoolState {
  const factory _GetschoolState(
      {required final bool isLoading,
      required final bool isError,
      required final List<School> school,
      required final Option<Either<MainFailure, List<School>>>
          successorFailure}) = _$GetschoolStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  List<School> get school;
  @override
  Option<Either<MainFailure, List<School>>> get successorFailure;
  @override
  @JsonKey(ignore: true)
  _$$GetschoolStateImplCopyWith<_$GetschoolStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
