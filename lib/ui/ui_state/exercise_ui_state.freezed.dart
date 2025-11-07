// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExerciseUiState {
  Exercise get exercise;
  int get itemIndex;
  String get sentence;
  List<String> get options;
  Future? get soundFuture;
  bool get isPlayingAudio;
  List<int> get notSolvedItems;
  List<int> get solvedItems;
  List<int> get passedItems;
  bool get checking;

  /// Create a copy of ExerciseUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExerciseUiStateCopyWith<ExerciseUiState> get copyWith =>
      _$ExerciseUiStateCopyWithImpl<ExerciseUiState>(
          this as ExerciseUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExerciseUiState &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.itemIndex, itemIndex) ||
                other.itemIndex == itemIndex) &&
            (identical(other.sentence, sentence) ||
                other.sentence == sentence) &&
            const DeepCollectionEquality().equals(other.options, options) &&
            (identical(other.soundFuture, soundFuture) ||
                other.soundFuture == soundFuture) &&
            (identical(other.isPlayingAudio, isPlayingAudio) ||
                other.isPlayingAudio == isPlayingAudio) &&
            const DeepCollectionEquality()
                .equals(other.notSolvedItems, notSolvedItems) &&
            const DeepCollectionEquality()
                .equals(other.solvedItems, solvedItems) &&
            const DeepCollectionEquality()
                .equals(other.passedItems, passedItems) &&
            (identical(other.checking, checking) ||
                other.checking == checking));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      exercise,
      itemIndex,
      sentence,
      const DeepCollectionEquality().hash(options),
      soundFuture,
      isPlayingAudio,
      const DeepCollectionEquality().hash(notSolvedItems),
      const DeepCollectionEquality().hash(solvedItems),
      const DeepCollectionEquality().hash(passedItems),
      checking);

  @override
  String toString() {
    return 'ExerciseUiState(exercise: $exercise, itemIndex: $itemIndex, sentence: $sentence, options: $options, soundFuture: $soundFuture, isPlayingAudio: $isPlayingAudio, notSolvedItems: $notSolvedItems, solvedItems: $solvedItems, passedItems: $passedItems, checking: $checking)';
  }
}

/// @nodoc
abstract mixin class $ExerciseUiStateCopyWith<$Res> {
  factory $ExerciseUiStateCopyWith(
          ExerciseUiState value, $Res Function(ExerciseUiState) _then) =
      _$ExerciseUiStateCopyWithImpl;
  @useResult
  $Res call(
      {Exercise exercise,
      int itemIndex,
      String sentence,
      List<String> options,
      Future? soundFuture,
      bool isPlayingAudio,
      List<int> notSolvedItems,
      List<int> solvedItems,
      List<int> passedItems,
      bool checking});

  $ExerciseCopyWith<$Res> get exercise;
}

/// @nodoc
class _$ExerciseUiStateCopyWithImpl<$Res>
    implements $ExerciseUiStateCopyWith<$Res> {
  _$ExerciseUiStateCopyWithImpl(this._self, this._then);

  final ExerciseUiState _self;
  final $Res Function(ExerciseUiState) _then;

  /// Create a copy of ExerciseUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
    Object? itemIndex = null,
    Object? sentence = null,
    Object? options = null,
    Object? soundFuture = freezed,
    Object? isPlayingAudio = null,
    Object? notSolvedItems = null,
    Object? solvedItems = null,
    Object? passedItems = null,
    Object? checking = null,
  }) {
    return _then(_self.copyWith(
      exercise: null == exercise
          ? _self.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as Exercise,
      itemIndex: null == itemIndex
          ? _self.itemIndex
          : itemIndex // ignore: cast_nullable_to_non_nullable
              as int,
      sentence: null == sentence
          ? _self.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _self.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      soundFuture: freezed == soundFuture
          ? _self.soundFuture
          : soundFuture // ignore: cast_nullable_to_non_nullable
              as Future?,
      isPlayingAudio: null == isPlayingAudio
          ? _self.isPlayingAudio
          : isPlayingAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      notSolvedItems: null == notSolvedItems
          ? _self.notSolvedItems
          : notSolvedItems // ignore: cast_nullable_to_non_nullable
              as List<int>,
      solvedItems: null == solvedItems
          ? _self.solvedItems
          : solvedItems // ignore: cast_nullable_to_non_nullable
              as List<int>,
      passedItems: null == passedItems
          ? _self.passedItems
          : passedItems // ignore: cast_nullable_to_non_nullable
              as List<int>,
      checking: null == checking
          ? _self.checking
          : checking // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ExerciseUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExerciseCopyWith<$Res> get exercise {
    return $ExerciseCopyWith<$Res>(_self.exercise, (value) {
      return _then(_self.copyWith(exercise: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ExerciseUiState].
extension ExerciseUiStatePatterns on ExerciseUiState {
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
    TResult Function(_ExerciseUiState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExerciseUiState() when $default != null:
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
    TResult Function(_ExerciseUiState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExerciseUiState():
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
    TResult? Function(_ExerciseUiState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExerciseUiState() when $default != null:
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
    TResult Function(
            Exercise exercise,
            int itemIndex,
            String sentence,
            List<String> options,
            Future? soundFuture,
            bool isPlayingAudio,
            List<int> notSolvedItems,
            List<int> solvedItems,
            List<int> passedItems,
            bool checking)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExerciseUiState() when $default != null:
        return $default(
            _that.exercise,
            _that.itemIndex,
            _that.sentence,
            _that.options,
            _that.soundFuture,
            _that.isPlayingAudio,
            _that.notSolvedItems,
            _that.solvedItems,
            _that.passedItems,
            _that.checking);
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
    TResult Function(
            Exercise exercise,
            int itemIndex,
            String sentence,
            List<String> options,
            Future? soundFuture,
            bool isPlayingAudio,
            List<int> notSolvedItems,
            List<int> solvedItems,
            List<int> passedItems,
            bool checking)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExerciseUiState():
        return $default(
            _that.exercise,
            _that.itemIndex,
            _that.sentence,
            _that.options,
            _that.soundFuture,
            _that.isPlayingAudio,
            _that.notSolvedItems,
            _that.solvedItems,
            _that.passedItems,
            _that.checking);
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
    TResult? Function(
            Exercise exercise,
            int itemIndex,
            String sentence,
            List<String> options,
            Future? soundFuture,
            bool isPlayingAudio,
            List<int> notSolvedItems,
            List<int> solvedItems,
            List<int> passedItems,
            bool checking)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExerciseUiState() when $default != null:
        return $default(
            _that.exercise,
            _that.itemIndex,
            _that.sentence,
            _that.options,
            _that.soundFuture,
            _that.isPlayingAudio,
            _that.notSolvedItems,
            _that.solvedItems,
            _that.passedItems,
            _that.checking);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExerciseUiState implements ExerciseUiState {
  const _ExerciseUiState(
      {required this.exercise,
      required this.itemIndex,
      required this.sentence,
      required final List<String> options,
      required this.soundFuture,
      required this.isPlayingAudio,
      required final List<int> notSolvedItems,
      required final List<int> solvedItems,
      required final List<int> passedItems,
      required this.checking})
      : _options = options,
        _notSolvedItems = notSolvedItems,
        _solvedItems = solvedItems,
        _passedItems = passedItems;

  @override
  final Exercise exercise;
  @override
  final int itemIndex;
  @override
  final String sentence;
  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final Future? soundFuture;
  @override
  final bool isPlayingAudio;
  final List<int> _notSolvedItems;
  @override
  List<int> get notSolvedItems {
    if (_notSolvedItems is EqualUnmodifiableListView) return _notSolvedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notSolvedItems);
  }

  final List<int> _solvedItems;
  @override
  List<int> get solvedItems {
    if (_solvedItems is EqualUnmodifiableListView) return _solvedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_solvedItems);
  }

  final List<int> _passedItems;
  @override
  List<int> get passedItems {
    if (_passedItems is EqualUnmodifiableListView) return _passedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_passedItems);
  }

  @override
  final bool checking;

  /// Create a copy of ExerciseUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExerciseUiStateCopyWith<_ExerciseUiState> get copyWith =>
      __$ExerciseUiStateCopyWithImpl<_ExerciseUiState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExerciseUiState &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.itemIndex, itemIndex) ||
                other.itemIndex == itemIndex) &&
            (identical(other.sentence, sentence) ||
                other.sentence == sentence) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.soundFuture, soundFuture) ||
                other.soundFuture == soundFuture) &&
            (identical(other.isPlayingAudio, isPlayingAudio) ||
                other.isPlayingAudio == isPlayingAudio) &&
            const DeepCollectionEquality()
                .equals(other._notSolvedItems, _notSolvedItems) &&
            const DeepCollectionEquality()
                .equals(other._solvedItems, _solvedItems) &&
            const DeepCollectionEquality()
                .equals(other._passedItems, _passedItems) &&
            (identical(other.checking, checking) ||
                other.checking == checking));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      exercise,
      itemIndex,
      sentence,
      const DeepCollectionEquality().hash(_options),
      soundFuture,
      isPlayingAudio,
      const DeepCollectionEquality().hash(_notSolvedItems),
      const DeepCollectionEquality().hash(_solvedItems),
      const DeepCollectionEquality().hash(_passedItems),
      checking);

  @override
  String toString() {
    return 'ExerciseUiState(exercise: $exercise, itemIndex: $itemIndex, sentence: $sentence, options: $options, soundFuture: $soundFuture, isPlayingAudio: $isPlayingAudio, notSolvedItems: $notSolvedItems, solvedItems: $solvedItems, passedItems: $passedItems, checking: $checking)';
  }
}

/// @nodoc
abstract mixin class _$ExerciseUiStateCopyWith<$Res>
    implements $ExerciseUiStateCopyWith<$Res> {
  factory _$ExerciseUiStateCopyWith(
          _ExerciseUiState value, $Res Function(_ExerciseUiState) _then) =
      __$ExerciseUiStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Exercise exercise,
      int itemIndex,
      String sentence,
      List<String> options,
      Future? soundFuture,
      bool isPlayingAudio,
      List<int> notSolvedItems,
      List<int> solvedItems,
      List<int> passedItems,
      bool checking});

  @override
  $ExerciseCopyWith<$Res> get exercise;
}

/// @nodoc
class __$ExerciseUiStateCopyWithImpl<$Res>
    implements _$ExerciseUiStateCopyWith<$Res> {
  __$ExerciseUiStateCopyWithImpl(this._self, this._then);

  final _ExerciseUiState _self;
  final $Res Function(_ExerciseUiState) _then;

  /// Create a copy of ExerciseUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? exercise = null,
    Object? itemIndex = null,
    Object? sentence = null,
    Object? options = null,
    Object? soundFuture = freezed,
    Object? isPlayingAudio = null,
    Object? notSolvedItems = null,
    Object? solvedItems = null,
    Object? passedItems = null,
    Object? checking = null,
  }) {
    return _then(_ExerciseUiState(
      exercise: null == exercise
          ? _self.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as Exercise,
      itemIndex: null == itemIndex
          ? _self.itemIndex
          : itemIndex // ignore: cast_nullable_to_non_nullable
              as int,
      sentence: null == sentence
          ? _self.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _self._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      soundFuture: freezed == soundFuture
          ? _self.soundFuture
          : soundFuture // ignore: cast_nullable_to_non_nullable
              as Future?,
      isPlayingAudio: null == isPlayingAudio
          ? _self.isPlayingAudio
          : isPlayingAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      notSolvedItems: null == notSolvedItems
          ? _self._notSolvedItems
          : notSolvedItems // ignore: cast_nullable_to_non_nullable
              as List<int>,
      solvedItems: null == solvedItems
          ? _self._solvedItems
          : solvedItems // ignore: cast_nullable_to_non_nullable
              as List<int>,
      passedItems: null == passedItems
          ? _self._passedItems
          : passedItems // ignore: cast_nullable_to_non_nullable
              as List<int>,
      checking: null == checking
          ? _self.checking
          : checking // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ExerciseUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExerciseCopyWith<$Res> get exercise {
    return $ExerciseCopyWith<$Res>(_self.exercise, (value) {
      return _then(_self.copyWith(exercise: value));
    });
  }
}

// dart format on
