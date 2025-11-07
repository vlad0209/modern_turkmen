// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutorial_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TutorialUiState {
  Tutorial get tutorial;
  String? get exerciseId;

  /// Create a copy of TutorialUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TutorialUiStateCopyWith<TutorialUiState> get copyWith =>
      _$TutorialUiStateCopyWithImpl<TutorialUiState>(
          this as TutorialUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TutorialUiState &&
            (identical(other.tutorial, tutorial) ||
                other.tutorial == tutorial) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tutorial, exerciseId);

  @override
  String toString() {
    return 'TutorialUiState(tutorial: $tutorial, exerciseId: $exerciseId)';
  }
}

/// @nodoc
abstract mixin class $TutorialUiStateCopyWith<$Res> {
  factory $TutorialUiStateCopyWith(
          TutorialUiState value, $Res Function(TutorialUiState) _then) =
      _$TutorialUiStateCopyWithImpl;
  @useResult
  $Res call({Tutorial tutorial, String? exerciseId});

  $TutorialCopyWith<$Res> get tutorial;
}

/// @nodoc
class _$TutorialUiStateCopyWithImpl<$Res>
    implements $TutorialUiStateCopyWith<$Res> {
  _$TutorialUiStateCopyWithImpl(this._self, this._then);

  final TutorialUiState _self;
  final $Res Function(TutorialUiState) _then;

  /// Create a copy of TutorialUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tutorial = null,
    Object? exerciseId = freezed,
  }) {
    return _then(_self.copyWith(
      tutorial: null == tutorial
          ? _self.tutorial
          : tutorial // ignore: cast_nullable_to_non_nullable
              as Tutorial,
      exerciseId: freezed == exerciseId
          ? _self.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of TutorialUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TutorialCopyWith<$Res> get tutorial {
    return $TutorialCopyWith<$Res>(_self.tutorial, (value) {
      return _then(_self.copyWith(tutorial: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TutorialUiState].
extension TutorialUiStatePatterns on TutorialUiState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TutorialUiState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TutorialUiState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TutorialUiState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TutorialUiState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TutorialUiState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TutorialUiState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Tutorial tutorial, String? exerciseId)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TutorialUiState() when $default != null:
        return $default(_that.tutorial, _that.exerciseId);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Tutorial tutorial, String? exerciseId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TutorialUiState():
        return $default(_that.tutorial, _that.exerciseId);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Tutorial tutorial, String? exerciseId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TutorialUiState() when $default != null:
        return $default(_that.tutorial, _that.exerciseId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TutorialUiState implements TutorialUiState {
  const _TutorialUiState({required this.tutorial, required this.exerciseId});

  @override
  final Tutorial tutorial;
  @override
  final String? exerciseId;

  /// Create a copy of TutorialUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TutorialUiStateCopyWith<_TutorialUiState> get copyWith =>
      __$TutorialUiStateCopyWithImpl<_TutorialUiState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TutorialUiState &&
            (identical(other.tutorial, tutorial) ||
                other.tutorial == tutorial) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tutorial, exerciseId);

  @override
  String toString() {
    return 'TutorialUiState(tutorial: $tutorial, exerciseId: $exerciseId)';
  }
}

/// @nodoc
abstract mixin class _$TutorialUiStateCopyWith<$Res>
    implements $TutorialUiStateCopyWith<$Res> {
  factory _$TutorialUiStateCopyWith(
          _TutorialUiState value, $Res Function(_TutorialUiState) _then) =
      __$TutorialUiStateCopyWithImpl;
  @override
  @useResult
  $Res call({Tutorial tutorial, String? exerciseId});

  @override
  $TutorialCopyWith<$Res> get tutorial;
}

/// @nodoc
class __$TutorialUiStateCopyWithImpl<$Res>
    implements _$TutorialUiStateCopyWith<$Res> {
  __$TutorialUiStateCopyWithImpl(this._self, this._then);

  final _TutorialUiState _self;
  final $Res Function(_TutorialUiState) _then;

  /// Create a copy of TutorialUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tutorial = null,
    Object? exerciseId = freezed,
  }) {
    return _then(_TutorialUiState(
      tutorial: null == tutorial
          ? _self.tutorial
          : tutorial // ignore: cast_nullable_to_non_nullable
              as Tutorial,
      exerciseId: freezed == exerciseId
          ? _self.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of TutorialUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TutorialCopyWith<$Res> get tutorial {
    return $TutorialCopyWith<$Res>(_self.tutorial, (value) {
      return _then(_self.copyWith(tutorial: value));
    });
  }
}

// dart format on
