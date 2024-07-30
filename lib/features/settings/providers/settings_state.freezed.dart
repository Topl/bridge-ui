// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsState {
  bool get demoMode => throw _privateConstructorUsedError;
  UiTheme get theme => throw _privateConstructorUsedError;
  double get inactivityTimeout =>
      throw _privateConstructorUsedError; // in minutes
  Language get language => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  FiatCurrency get preferredFiatCurrency => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call(
      {bool demoMode,
      UiTheme theme,
      double inactivityTimeout,
      Language language,
      String nickName,
      FiatCurrency preferredFiatCurrency});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? demoMode = null,
    Object? theme = null,
    Object? inactivityTimeout = null,
    Object? language = null,
    Object? nickName = null,
    Object? preferredFiatCurrency = null,
  }) {
    return _then(_value.copyWith(
      demoMode: null == demoMode
          ? _value.demoMode
          : demoMode // ignore: cast_nullable_to_non_nullable
              as bool,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as UiTheme,
      inactivityTimeout: null == inactivityTimeout
          ? _value.inactivityTimeout
          : inactivityTimeout // ignore: cast_nullable_to_non_nullable
              as double,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      preferredFiatCurrency: null == preferredFiatCurrency
          ? _value.preferredFiatCurrency
          : preferredFiatCurrency // ignore: cast_nullable_to_non_nullable
              as FiatCurrency,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(
          _$SettingsStateImpl value, $Res Function(_$SettingsStateImpl) then) =
      __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool demoMode,
      UiTheme theme,
      double inactivityTimeout,
      Language language,
      String nickName,
      FiatCurrency preferredFiatCurrency});
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(
      _$SettingsStateImpl _value, $Res Function(_$SettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? demoMode = null,
    Object? theme = null,
    Object? inactivityTimeout = null,
    Object? language = null,
    Object? nickName = null,
    Object? preferredFiatCurrency = null,
  }) {
    return _then(_$SettingsStateImpl(
      demoMode: null == demoMode
          ? _value.demoMode
          : demoMode // ignore: cast_nullable_to_non_nullable
              as bool,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as UiTheme,
      inactivityTimeout: null == inactivityTimeout
          ? _value.inactivityTimeout
          : inactivityTimeout // ignore: cast_nullable_to_non_nullable
              as double,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      preferredFiatCurrency: null == preferredFiatCurrency
          ? _value.preferredFiatCurrency
          : preferredFiatCurrency // ignore: cast_nullable_to_non_nullable
              as FiatCurrency,
    ));
  }
}

/// @nodoc

class _$SettingsStateImpl implements _SettingsState {
  const _$SettingsStateImpl(
      {required this.demoMode,
      required this.theme,
      required this.inactivityTimeout,
      required this.language,
      required this.nickName,
      required this.preferredFiatCurrency});

  @override
  final bool demoMode;
  @override
  final UiTheme theme;
  @override
  final double inactivityTimeout;
// in minutes
  @override
  final Language language;
  @override
  final String nickName;
  @override
  final FiatCurrency preferredFiatCurrency;

  @override
  String toString() {
    return 'SettingsState(demoMode: $demoMode, theme: $theme, inactivityTimeout: $inactivityTimeout, language: $language, nickName: $nickName, preferredFiatCurrency: $preferredFiatCurrency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            (identical(other.demoMode, demoMode) ||
                other.demoMode == demoMode) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.inactivityTimeout, inactivityTimeout) ||
                other.inactivityTimeout == inactivityTimeout) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.preferredFiatCurrency, preferredFiatCurrency) ||
                other.preferredFiatCurrency == preferredFiatCurrency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, demoMode, theme,
      inactivityTimeout, language, nickName, preferredFiatCurrency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState(
      {required final bool demoMode,
      required final UiTheme theme,
      required final double inactivityTimeout,
      required final Language language,
      required final String nickName,
      required final FiatCurrency preferredFiatCurrency}) = _$SettingsStateImpl;

  @override
  bool get demoMode;
  @override
  UiTheme get theme;
  @override
  double get inactivityTimeout;
  @override // in minutes
  Language get language;
  @override
  String get nickName;
  @override
  FiatCurrency get preferredFiatCurrency;
  @override
  @JsonKey(ignore: true)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
