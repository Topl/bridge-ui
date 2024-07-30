// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bridge_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BridgeState {
  Currency get currency => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  CryptoRates get rates => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BridgeStateCopyWith<BridgeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BridgeStateCopyWith<$Res> {
  factory $BridgeStateCopyWith(
          BridgeState value, $Res Function(BridgeState) then) =
      _$BridgeStateCopyWithImpl<$Res, BridgeState>;
  @useResult
  $Res call({Currency currency, double value, CryptoRates rates, bool loading});
}

/// @nodoc
class _$BridgeStateCopyWithImpl<$Res, $Val extends BridgeState>
    implements $BridgeStateCopyWith<$Res> {
  _$BridgeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? value = null,
    Object? rates = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      rates: null == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as CryptoRates,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BridgeStateImplCopyWith<$Res>
    implements $BridgeStateCopyWith<$Res> {
  factory _$$BridgeStateImplCopyWith(
          _$BridgeStateImpl value, $Res Function(_$BridgeStateImpl) then) =
      __$$BridgeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Currency currency, double value, CryptoRates rates, bool loading});
}

/// @nodoc
class __$$BridgeStateImplCopyWithImpl<$Res>
    extends _$BridgeStateCopyWithImpl<$Res, _$BridgeStateImpl>
    implements _$$BridgeStateImplCopyWith<$Res> {
  __$$BridgeStateImplCopyWithImpl(
      _$BridgeStateImpl _value, $Res Function(_$BridgeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? value = null,
    Object? rates = null,
    Object? loading = null,
  }) {
    return _then(_$BridgeStateImpl(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      rates: null == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as CryptoRates,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BridgeStateImpl implements _BridgeState {
  const _$BridgeStateImpl(
      {required this.currency,
      required this.value,
      required this.rates,
      required this.loading});

  @override
  final Currency currency;
  @override
  final double value;
  @override
  final CryptoRates rates;
  @override
  final bool loading;

  @override
  String toString() {
    return 'BridgeState(currency: $currency, value: $value, rates: $rates, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BridgeStateImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.rates, rates) || other.rates == rates) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currency, value, rates, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BridgeStateImplCopyWith<_$BridgeStateImpl> get copyWith =>
      __$$BridgeStateImplCopyWithImpl<_$BridgeStateImpl>(this, _$identity);
}

abstract class _BridgeState implements BridgeState {
  const factory _BridgeState(
      {required final Currency currency,
      required final double value,
      required final CryptoRates rates,
      required final bool loading}) = _$BridgeStateImpl;

  @override
  Currency get currency;
  @override
  double get value;
  @override
  CryptoRates get rates;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$BridgeStateImplCopyWith<_$BridgeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
