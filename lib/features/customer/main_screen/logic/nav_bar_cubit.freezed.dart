// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nav_bar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NavBarState {
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavBarStateCopyWith<NavBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavBarStateCopyWith<$Res> {
  factory $NavBarStateCopyWith(
          NavBarState value, $Res Function(NavBarState) then) =
      _$NavBarStateCopyWithImpl<$Res, NavBarState>;
  @useResult
  $Res call({int currentIndex});
}

/// @nodoc
class _$NavBarStateCopyWithImpl<$Res, $Val extends NavBarState>
    implements $NavBarStateCopyWith<$Res> {
  _$NavBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
  }) {
    return _then(_value.copyWith(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IndexChangedImplCopyWith<$Res>
    implements $NavBarStateCopyWith<$Res> {
  factory _$$IndexChangedImplCopyWith(
          _$IndexChangedImpl value, $Res Function(_$IndexChangedImpl) then) =
      __$$IndexChangedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentIndex});
}

/// @nodoc
class __$$IndexChangedImplCopyWithImpl<$Res>
    extends _$NavBarStateCopyWithImpl<$Res, _$IndexChangedImpl>
    implements _$$IndexChangedImplCopyWith<$Res> {
  __$$IndexChangedImplCopyWithImpl(
      _$IndexChangedImpl _value, $Res Function(_$IndexChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
  }) {
    return _then(_$IndexChangedImpl(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IndexChangedImpl implements _IndexChanged {
  const _$IndexChangedImpl({required this.currentIndex});

  @override
  final int currentIndex;

  @override
  String toString() {
    return 'NavBarState(currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndexChangedImpl &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IndexChangedImplCopyWith<_$IndexChangedImpl> get copyWith =>
      __$$IndexChangedImplCopyWithImpl<_$IndexChangedImpl>(this, _$identity);
}

abstract class _IndexChanged implements NavBarState {
  const factory _IndexChanged({required final int currentIndex}) =
      _$IndexChangedImpl;

  @override
  int get currentIndex;
  @override
  @JsonKey(ignore: true)
  _$$IndexChangedImplCopyWith<_$IndexChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
