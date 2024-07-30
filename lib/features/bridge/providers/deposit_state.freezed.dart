// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DepositState {
  Stage get stage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DepositStateCopyWith<DepositState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositStateCopyWith<$Res> {
  factory $DepositStateCopyWith(
          DepositState value, $Res Function(DepositState) then) =
      _$DepositStateCopyWithImpl<$Res, DepositState>;
  @useResult
  $Res call({Stage stage});
}

/// @nodoc
class _$DepositStateCopyWithImpl<$Res, $Val extends DepositState>
    implements $DepositStateCopyWith<$Res> {
  _$DepositStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
  }) {
    return _then(_value.copyWith(
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as Stage,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepositStateImplCopyWith<$Res>
    implements $DepositStateCopyWith<$Res> {
  factory _$$DepositStateImplCopyWith(
          _$DepositStateImpl value, $Res Function(_$DepositStateImpl) then) =
      __$$DepositStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Stage stage});
}

/// @nodoc
class __$$DepositStateImplCopyWithImpl<$Res>
    extends _$DepositStateCopyWithImpl<$Res, _$DepositStateImpl>
    implements _$$DepositStateImplCopyWith<$Res> {
  __$$DepositStateImplCopyWithImpl(
      _$DepositStateImpl _value, $Res Function(_$DepositStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
  }) {
    return _then(_$DepositStateImpl(
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as Stage,
    ));
  }
}

/// @nodoc

class _$DepositStateImpl implements _DepositState {
  const _$DepositStateImpl({required this.stage});

  @override
  final Stage stage;

  @override
  String toString() {
    return 'DepositState(stage: $stage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepositStateImpl &&
            (identical(other.stage, stage) || other.stage == stage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DepositStateImplCopyWith<_$DepositStateImpl> get copyWith =>
      __$$DepositStateImplCopyWithImpl<_$DepositStateImpl>(this, _$identity);
}

abstract class _DepositState implements DepositState {
  const factory _DepositState({required final Stage stage}) =
      _$DepositStateImpl;

  @override
  Stage get stage;
  @override
  @JsonKey(ignore: true)
  _$$DepositStateImplCopyWith<_$DepositStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
