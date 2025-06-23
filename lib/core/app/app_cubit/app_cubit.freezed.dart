// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isDark) themeChangeMode,
    required TResult Function(Locale locle) langChangeMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isDark)? themeChangeMode,
    TResult? Function(Locale locle)? langChangeMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isDark)? themeChangeMode,
    TResult Function(Locale locle)? langChangeMode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ThemeChangeModeState value) themeChangeMode,
    required TResult Function(LanguageChangeModeState value) langChangeMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ThemeChangeModeState value)? themeChangeMode,
    TResult? Function(LanguageChangeModeState value)? langChangeMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ThemeChangeModeState value)? themeChangeMode,
    TResult Function(LanguageChangeModeState value)? langChangeMode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AppState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isDark) themeChangeMode,
    required TResult Function(Locale locle) langChangeMode,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isDark)? themeChangeMode,
    TResult? Function(Locale locle)? langChangeMode,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isDark)? themeChangeMode,
    TResult Function(Locale locle)? langChangeMode,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ThemeChangeModeState value) themeChangeMode,
    required TResult Function(LanguageChangeModeState value) langChangeMode,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ThemeChangeModeState value)? themeChangeMode,
    TResult? Function(LanguageChangeModeState value)? langChangeMode,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ThemeChangeModeState value)? themeChangeMode,
    TResult Function(LanguageChangeModeState value)? langChangeMode,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AppState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ThemeChangeModeStateImplCopyWith<$Res> {
  factory _$$ThemeChangeModeStateImplCopyWith(_$ThemeChangeModeStateImpl value,
          $Res Function(_$ThemeChangeModeStateImpl) then) =
      __$$ThemeChangeModeStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isDark});
}

/// @nodoc
class __$$ThemeChangeModeStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$ThemeChangeModeStateImpl>
    implements _$$ThemeChangeModeStateImplCopyWith<$Res> {
  __$$ThemeChangeModeStateImplCopyWithImpl(_$ThemeChangeModeStateImpl _value,
      $Res Function(_$ThemeChangeModeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDark = null,
  }) {
    return _then(_$ThemeChangeModeStateImpl(
      isDark: null == isDark
          ? _value.isDark
          : isDark // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ThemeChangeModeStateImpl implements ThemeChangeModeState {
  const _$ThemeChangeModeStateImpl({required this.isDark});

  @override
  final bool isDark;

  @override
  String toString() {
    return 'AppState.themeChangeMode(isDark: $isDark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeChangeModeStateImpl &&
            (identical(other.isDark, isDark) || other.isDark == isDark));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDark);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeChangeModeStateImplCopyWith<_$ThemeChangeModeStateImpl>
      get copyWith =>
          __$$ThemeChangeModeStateImplCopyWithImpl<_$ThemeChangeModeStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isDark) themeChangeMode,
    required TResult Function(Locale locle) langChangeMode,
  }) {
    return themeChangeMode(isDark);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isDark)? themeChangeMode,
    TResult? Function(Locale locle)? langChangeMode,
  }) {
    return themeChangeMode?.call(isDark);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isDark)? themeChangeMode,
    TResult Function(Locale locle)? langChangeMode,
    required TResult orElse(),
  }) {
    if (themeChangeMode != null) {
      return themeChangeMode(isDark);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ThemeChangeModeState value) themeChangeMode,
    required TResult Function(LanguageChangeModeState value) langChangeMode,
  }) {
    return themeChangeMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ThemeChangeModeState value)? themeChangeMode,
    TResult? Function(LanguageChangeModeState value)? langChangeMode,
  }) {
    return themeChangeMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ThemeChangeModeState value)? themeChangeMode,
    TResult Function(LanguageChangeModeState value)? langChangeMode,
    required TResult orElse(),
  }) {
    if (themeChangeMode != null) {
      return themeChangeMode(this);
    }
    return orElse();
  }
}

abstract class ThemeChangeModeState implements AppState {
  const factory ThemeChangeModeState({required final bool isDark}) =
      _$ThemeChangeModeStateImpl;

  bool get isDark;
  @JsonKey(ignore: true)
  _$$ThemeChangeModeStateImplCopyWith<_$ThemeChangeModeStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LanguageChangeModeStateImplCopyWith<$Res> {
  factory _$$LanguageChangeModeStateImplCopyWith(
          _$LanguageChangeModeStateImpl value,
          $Res Function(_$LanguageChangeModeStateImpl) then) =
      __$$LanguageChangeModeStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Locale locle});
}

/// @nodoc
class __$$LanguageChangeModeStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$LanguageChangeModeStateImpl>
    implements _$$LanguageChangeModeStateImplCopyWith<$Res> {
  __$$LanguageChangeModeStateImplCopyWithImpl(
      _$LanguageChangeModeStateImpl _value,
      $Res Function(_$LanguageChangeModeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locle = null,
  }) {
    return _then(_$LanguageChangeModeStateImpl(
      locle: null == locle
          ? _value.locle
          : locle // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$LanguageChangeModeStateImpl implements LanguageChangeModeState {
  const _$LanguageChangeModeStateImpl({required this.locle});

  @override
  final Locale locle;

  @override
  String toString() {
    return 'AppState.langChangeMode(locle: $locle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageChangeModeStateImpl &&
            (identical(other.locle, locle) || other.locle == locle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageChangeModeStateImplCopyWith<_$LanguageChangeModeStateImpl>
      get copyWith => __$$LanguageChangeModeStateImplCopyWithImpl<
          _$LanguageChangeModeStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isDark) themeChangeMode,
    required TResult Function(Locale locle) langChangeMode,
  }) {
    return langChangeMode(locle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isDark)? themeChangeMode,
    TResult? Function(Locale locle)? langChangeMode,
  }) {
    return langChangeMode?.call(locle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isDark)? themeChangeMode,
    TResult Function(Locale locle)? langChangeMode,
    required TResult orElse(),
  }) {
    if (langChangeMode != null) {
      return langChangeMode(locle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ThemeChangeModeState value) themeChangeMode,
    required TResult Function(LanguageChangeModeState value) langChangeMode,
  }) {
    return langChangeMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ThemeChangeModeState value)? themeChangeMode,
    TResult? Function(LanguageChangeModeState value)? langChangeMode,
  }) {
    return langChangeMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ThemeChangeModeState value)? themeChangeMode,
    TResult Function(LanguageChangeModeState value)? langChangeMode,
    required TResult orElse(),
  }) {
    if (langChangeMode != null) {
      return langChangeMode(this);
    }
    return orElse();
  }
}

abstract class LanguageChangeModeState implements AppState {
  const factory LanguageChangeModeState({required final Locale locle}) =
      _$LanguageChangeModeStateImpl;

  Locale get locle;
  @JsonKey(ignore: true)
  _$$LanguageChangeModeStateImplCopyWith<_$LanguageChangeModeStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
