// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_kit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServiceKitState {
  StorageApi get storageApi => throw _privateConstructorUsedError;
  ContractStorageApi get contractStorageApi =>
      throw _privateConstructorUsedError;
  FellowshipStorageApi get fellowshipStorageApi =>
      throw _privateConstructorUsedError;
  WalletApi get walletApi => throw _privateConstructorUsedError;
  WalletStateApi get walletStateApi => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceKitStateCopyWith<ServiceKitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceKitStateCopyWith<$Res> {
  factory $ServiceKitStateCopyWith(
          ServiceKitState value, $Res Function(ServiceKitState) then) =
      _$ServiceKitStateCopyWithImpl<$Res, ServiceKitState>;
  @useResult
  $Res call(
      {StorageApi storageApi,
      ContractStorageApi contractStorageApi,
      FellowshipStorageApi fellowshipStorageApi,
      WalletApi walletApi,
      WalletStateApi walletStateApi});
}

/// @nodoc
class _$ServiceKitStateCopyWithImpl<$Res, $Val extends ServiceKitState>
    implements $ServiceKitStateCopyWith<$Res> {
  _$ServiceKitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storageApi = null,
    Object? contractStorageApi = null,
    Object? fellowshipStorageApi = null,
    Object? walletApi = null,
    Object? walletStateApi = null,
  }) {
    return _then(_value.copyWith(
      storageApi: null == storageApi
          ? _value.storageApi
          : storageApi // ignore: cast_nullable_to_non_nullable
              as StorageApi,
      contractStorageApi: null == contractStorageApi
          ? _value.contractStorageApi
          : contractStorageApi // ignore: cast_nullable_to_non_nullable
              as ContractStorageApi,
      fellowshipStorageApi: null == fellowshipStorageApi
          ? _value.fellowshipStorageApi
          : fellowshipStorageApi // ignore: cast_nullable_to_non_nullable
              as FellowshipStorageApi,
      walletApi: null == walletApi
          ? _value.walletApi
          : walletApi // ignore: cast_nullable_to_non_nullable
              as WalletApi,
      walletStateApi: null == walletStateApi
          ? _value.walletStateApi
          : walletStateApi // ignore: cast_nullable_to_non_nullable
              as WalletStateApi,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceKitStateImplCopyWith<$Res>
    implements $ServiceKitStateCopyWith<$Res> {
  factory _$$ServiceKitStateImplCopyWith(_$ServiceKitStateImpl value,
          $Res Function(_$ServiceKitStateImpl) then) =
      __$$ServiceKitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StorageApi storageApi,
      ContractStorageApi contractStorageApi,
      FellowshipStorageApi fellowshipStorageApi,
      WalletApi walletApi,
      WalletStateApi walletStateApi});
}

/// @nodoc
class __$$ServiceKitStateImplCopyWithImpl<$Res>
    extends _$ServiceKitStateCopyWithImpl<$Res, _$ServiceKitStateImpl>
    implements _$$ServiceKitStateImplCopyWith<$Res> {
  __$$ServiceKitStateImplCopyWithImpl(
      _$ServiceKitStateImpl _value, $Res Function(_$ServiceKitStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storageApi = null,
    Object? contractStorageApi = null,
    Object? fellowshipStorageApi = null,
    Object? walletApi = null,
    Object? walletStateApi = null,
  }) {
    return _then(_$ServiceKitStateImpl(
      storageApi: null == storageApi
          ? _value.storageApi
          : storageApi // ignore: cast_nullable_to_non_nullable
              as StorageApi,
      contractStorageApi: null == contractStorageApi
          ? _value.contractStorageApi
          : contractStorageApi // ignore: cast_nullable_to_non_nullable
              as ContractStorageApi,
      fellowshipStorageApi: null == fellowshipStorageApi
          ? _value.fellowshipStorageApi
          : fellowshipStorageApi // ignore: cast_nullable_to_non_nullable
              as FellowshipStorageApi,
      walletApi: null == walletApi
          ? _value.walletApi
          : walletApi // ignore: cast_nullable_to_non_nullable
              as WalletApi,
      walletStateApi: null == walletStateApi
          ? _value.walletStateApi
          : walletStateApi // ignore: cast_nullable_to_non_nullable
              as WalletStateApi,
    ));
  }
}

/// @nodoc

class _$ServiceKitStateImpl implements _ServiceKitState {
  _$ServiceKitStateImpl(
      {required this.storageApi,
      required this.contractStorageApi,
      required this.fellowshipStorageApi,
      required this.walletApi,
      required this.walletStateApi});

  @override
  final StorageApi storageApi;
  @override
  final ContractStorageApi contractStorageApi;
  @override
  final FellowshipStorageApi fellowshipStorageApi;
  @override
  final WalletApi walletApi;
  @override
  final WalletStateApi walletStateApi;

  @override
  String toString() {
    return 'ServiceKitState(storageApi: $storageApi, contractStorageApi: $contractStorageApi, fellowshipStorageApi: $fellowshipStorageApi, walletApi: $walletApi, walletStateApi: $walletStateApi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceKitStateImpl &&
            (identical(other.storageApi, storageApi) ||
                other.storageApi == storageApi) &&
            (identical(other.contractStorageApi, contractStorageApi) ||
                other.contractStorageApi == contractStorageApi) &&
            (identical(other.fellowshipStorageApi, fellowshipStorageApi) ||
                other.fellowshipStorageApi == fellowshipStorageApi) &&
            (identical(other.walletApi, walletApi) ||
                other.walletApi == walletApi) &&
            (identical(other.walletStateApi, walletStateApi) ||
                other.walletStateApi == walletStateApi));
  }

  @override
  int get hashCode => Object.hash(runtimeType, storageApi, contractStorageApi,
      fellowshipStorageApi, walletApi, walletStateApi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceKitStateImplCopyWith<_$ServiceKitStateImpl> get copyWith =>
      __$$ServiceKitStateImplCopyWithImpl<_$ServiceKitStateImpl>(
          this, _$identity);
}

abstract class _ServiceKitState implements ServiceKitState {
  factory _ServiceKitState(
      {required final StorageApi storageApi,
      required final ContractStorageApi contractStorageApi,
      required final FellowshipStorageApi fellowshipStorageApi,
      required final WalletApi walletApi,
      required final WalletStateApi walletStateApi}) = _$ServiceKitStateImpl;

  @override
  StorageApi get storageApi;
  @override
  ContractStorageApi get contractStorageApi;
  @override
  FellowshipStorageApi get fellowshipStorageApi;
  @override
  WalletApi get walletApi;
  @override
  WalletStateApi get walletStateApi;
  @override
  @JsonKey(ignore: true)
  _$$ServiceKitStateImplCopyWith<_$ServiceKitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
