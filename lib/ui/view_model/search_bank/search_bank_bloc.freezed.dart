// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bank_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchBankEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String bank) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String bank)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String bank)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Search value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Search value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchBankEventCopyWith<$Res> {
  factory $SearchBankEventCopyWith(
          SearchBankEvent value, $Res Function(SearchBankEvent) then) =
      _$SearchBankEventCopyWithImpl<$Res, SearchBankEvent>;
}

/// @nodoc
class _$SearchBankEventCopyWithImpl<$Res, $Val extends SearchBankEvent>
    implements $SearchBankEventCopyWith<$Res> {
  _$SearchBankEventCopyWithImpl(this._value, this._then);

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
    extends _$SearchBankEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'SearchBankEvent.started()';
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
    required TResult Function(String bank) search,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String bank)? search,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String bank)? search,
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
    required TResult Function(_Search value) search,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Search value)? search,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SearchBankEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String bank});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$SearchBankEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bank = null,
  }) {
    return _then(_$SearchImpl(
      bank: null == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchImpl implements _Search {
  const _$SearchImpl({required this.bank});

  @override
  final String bank;

  @override
  String toString() {
    return 'SearchBankEvent.search(bank: $bank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.bank, bank) || other.bank == bank));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bank);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String bank) search,
  }) {
    return search(bank);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String bank)? search,
  }) {
    return search?.call(bank);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String bank)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(bank);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Search value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Search value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements SearchBankEvent {
  const factory _Search({required final String bank}) = _$SearchImpl;

  String get bank;
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchBankState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  BankData get searchBank => throw _privateConstructorUsedError;
  Option<Either<MainFailure, BankData>> get successorFailure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchBankStateCopyWith<SearchBankState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchBankStateCopyWith<$Res> {
  factory $SearchBankStateCopyWith(
          SearchBankState value, $Res Function(SearchBankState) then) =
      _$SearchBankStateCopyWithImpl<$Res, SearchBankState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      BankData searchBank,
      Option<Either<MainFailure, BankData>> successorFailure});
}

/// @nodoc
class _$SearchBankStateCopyWithImpl<$Res, $Val extends SearchBankState>
    implements $SearchBankStateCopyWith<$Res> {
  _$SearchBankStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? searchBank = null,
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
      searchBank: null == searchBank
          ? _value.searchBank
          : searchBank // ignore: cast_nullable_to_non_nullable
              as BankData,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, BankData>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchBankStateImplCopyWith<$Res>
    implements $SearchBankStateCopyWith<$Res> {
  factory _$$SearchBankStateImplCopyWith(_$SearchBankStateImpl value,
          $Res Function(_$SearchBankStateImpl) then) =
      __$$SearchBankStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      BankData searchBank,
      Option<Either<MainFailure, BankData>> successorFailure});
}

/// @nodoc
class __$$SearchBankStateImplCopyWithImpl<$Res>
    extends _$SearchBankStateCopyWithImpl<$Res, _$SearchBankStateImpl>
    implements _$$SearchBankStateImplCopyWith<$Res> {
  __$$SearchBankStateImplCopyWithImpl(
      _$SearchBankStateImpl _value, $Res Function(_$SearchBankStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? searchBank = null,
    Object? successorFailure = null,
  }) {
    return _then(_$SearchBankStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      searchBank: null == searchBank
          ? _value.searchBank
          : searchBank // ignore: cast_nullable_to_non_nullable
              as BankData,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, BankData>>,
    ));
  }
}

/// @nodoc

class _$SearchBankStateImpl implements _SearchBankState {
  _$SearchBankStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.searchBank,
      required this.successorFailure});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final BankData searchBank;
  @override
  final Option<Either<MainFailure, BankData>> successorFailure;

  @override
  String toString() {
    return 'SearchBankState(isLoading: $isLoading, isError: $isError, searchBank: $searchBank, successorFailure: $successorFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchBankStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.searchBank, searchBank) ||
                other.searchBank == searchBank) &&
            (identical(other.successorFailure, successorFailure) ||
                other.successorFailure == successorFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, isError, searchBank, successorFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchBankStateImplCopyWith<_$SearchBankStateImpl> get copyWith =>
      __$$SearchBankStateImplCopyWithImpl<_$SearchBankStateImpl>(
          this, _$identity);
}

abstract class _SearchBankState implements SearchBankState {
  factory _SearchBankState(
      {required final bool isLoading,
      required final bool isError,
      required final BankData searchBank,
      required final Option<Either<MainFailure, BankData>>
          successorFailure}) = _$SearchBankStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  BankData get searchBank;
  @override
  Option<Either<MainFailure, BankData>> get successorFailure;
  @override
  @JsonKey(ignore: true)
  _$$SearchBankStateImplCopyWith<_$SearchBankStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
