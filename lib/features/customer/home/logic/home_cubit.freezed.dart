// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(PostModel order) singleOrderLoaded,
    required TResult Function() loading,
    required TResult Function(String error) tError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PostModel order)? singleOrderLoaded,
    TResult? Function()? loading,
    TResult? Function(String error)? tError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PostModel order)? singleOrderLoaded,
    TResult Function()? loading,
    TResult Function(String error)? tError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SingleOrderLoaded value) singleOrderLoaded,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) tError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SingleOrderLoaded value)? singleOrderLoaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? tError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SingleOrderLoaded value)? singleOrderLoaded,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? tError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

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
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'HomeState.initial()';
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
    required TResult Function(PostModel order) singleOrderLoaded,
    required TResult Function() loading,
    required TResult Function(String error) tError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PostModel order)? singleOrderLoaded,
    TResult? Function()? loading,
    TResult? Function(String error)? tError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PostModel order)? singleOrderLoaded,
    TResult Function()? loading,
    TResult Function(String error)? tError,
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
    required TResult Function(SingleOrderLoaded value) singleOrderLoaded,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) tError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SingleOrderLoaded value)? singleOrderLoaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? tError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SingleOrderLoaded value)? singleOrderLoaded,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? tError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SingleOrderLoadedImplCopyWith<$Res> {
  factory _$$SingleOrderLoadedImplCopyWith(_$SingleOrderLoadedImpl value,
          $Res Function(_$SingleOrderLoadedImpl) then) =
      __$$SingleOrderLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PostModel order});
}

/// @nodoc
class __$$SingleOrderLoadedImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$SingleOrderLoadedImpl>
    implements _$$SingleOrderLoadedImplCopyWith<$Res> {
  __$$SingleOrderLoadedImplCopyWithImpl(_$SingleOrderLoadedImpl _value,
      $Res Function(_$SingleOrderLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
  }) {
    return _then(_$SingleOrderLoadedImpl(
      null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as PostModel,
    ));
  }
}

/// @nodoc

class _$SingleOrderLoadedImpl implements SingleOrderLoaded {
  const _$SingleOrderLoadedImpl(this.order);

  @override
  final PostModel order;

  @override
  String toString() {
    return 'HomeState.singleOrderLoaded(order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleOrderLoadedImpl &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleOrderLoadedImplCopyWith<_$SingleOrderLoadedImpl> get copyWith =>
      __$$SingleOrderLoadedImplCopyWithImpl<_$SingleOrderLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(PostModel order) singleOrderLoaded,
    required TResult Function() loading,
    required TResult Function(String error) tError,
  }) {
    return singleOrderLoaded(order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PostModel order)? singleOrderLoaded,
    TResult? Function()? loading,
    TResult? Function(String error)? tError,
  }) {
    return singleOrderLoaded?.call(order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PostModel order)? singleOrderLoaded,
    TResult Function()? loading,
    TResult Function(String error)? tError,
    required TResult orElse(),
  }) {
    if (singleOrderLoaded != null) {
      return singleOrderLoaded(order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SingleOrderLoaded value) singleOrderLoaded,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) tError,
  }) {
    return singleOrderLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SingleOrderLoaded value)? singleOrderLoaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? tError,
  }) {
    return singleOrderLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SingleOrderLoaded value)? singleOrderLoaded,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? tError,
    required TResult orElse(),
  }) {
    if (singleOrderLoaded != null) {
      return singleOrderLoaded(this);
    }
    return orElse();
  }
}

abstract class SingleOrderLoaded implements HomeState {
  const factory SingleOrderLoaded(final PostModel order) =
      _$SingleOrderLoadedImpl;

  PostModel get order;
  @JsonKey(ignore: true)
  _$$SingleOrderLoadedImplCopyWith<_$SingleOrderLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(PostModel order) singleOrderLoaded,
    required TResult Function() loading,
    required TResult Function(String error) tError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PostModel order)? singleOrderLoaded,
    TResult? Function()? loading,
    TResult? Function(String error)? tError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PostModel order)? singleOrderLoaded,
    TResult Function()? loading,
    TResult Function(String error)? tError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SingleOrderLoaded value) singleOrderLoaded,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) tError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SingleOrderLoaded value)? singleOrderLoaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? tError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SingleOrderLoaded value)? singleOrderLoaded,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? tError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements HomeState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'HomeState.tError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(PostModel order) singleOrderLoaded,
    required TResult Function() loading,
    required TResult Function(String error) tError,
  }) {
    return tError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PostModel order)? singleOrderLoaded,
    TResult? Function()? loading,
    TResult? Function(String error)? tError,
  }) {
    return tError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PostModel order)? singleOrderLoaded,
    TResult Function()? loading,
    TResult Function(String error)? tError,
    required TResult orElse(),
  }) {
    if (tError != null) {
      return tError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SingleOrderLoaded value) singleOrderLoaded,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) tError,
  }) {
    return tError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SingleOrderLoaded value)? singleOrderLoaded,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? tError,
  }) {
    return tError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SingleOrderLoaded value)? singleOrderLoaded,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? tError,
    required TResult orElse(),
  }) {
    if (tError != null) {
      return tError(this);
    }
    return orElse();
  }
}

abstract class Error implements HomeState {
  const factory Error(final String error) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
