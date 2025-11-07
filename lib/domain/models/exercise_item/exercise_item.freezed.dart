// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExerciseItem {
  List<String> get options;
  String get sentence;
  String? get sound;
  String get translation;
  String get solution;

  /// Create a copy of ExerciseItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExerciseItemCopyWith<ExerciseItem> get copyWith =>
      _$ExerciseItemCopyWithImpl<ExerciseItem>(
          this as ExerciseItem, _$identity);

  /// Serializes this ExerciseItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExerciseItem &&
            const DeepCollectionEquality().equals(other.options, options) &&
            (identical(other.sentence, sentence) ||
                other.sentence == sentence) &&
            (identical(other.sound, sound) || other.sound == sound) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.solution, solution) ||
                other.solution == solution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(options),
      sentence,
      sound,
      translation,
      solution);

  @override
  String toString() {
    return 'ExerciseItem(options: $options, sentence: $sentence, sound: $sound, translation: $translation, solution: $solution)';
  }
}

/// @nodoc
abstract mixin class $ExerciseItemCopyWith<$Res> {
  factory $ExerciseItemCopyWith(
          ExerciseItem value, $Res Function(ExerciseItem) _then) =
      _$ExerciseItemCopyWithImpl;
  @useResult
  $Res call(
      {List<String> options,
      String sentence,
      String? sound,
      String translation,
      String solution});
}

/// @nodoc
class _$ExerciseItemCopyWithImpl<$Res> implements $ExerciseItemCopyWith<$Res> {
  _$ExerciseItemCopyWithImpl(this._self, this._then);

  final ExerciseItem _self;
  final $Res Function(ExerciseItem) _then;

  /// Create a copy of ExerciseItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? options = null,
    Object? sentence = null,
    Object? sound = freezed,
    Object? translation = null,
    Object? solution = null,
  }) {
    return _then(_self.copyWith(
      options: null == options
          ? _self.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sentence: null == sentence
          ? _self.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String,
      sound: freezed == sound
          ? _self.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as String?,
      translation: null == translation
          ? _self.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
      solution: null == solution
          ? _self.solution
          : solution // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ExerciseItem].
extension ExerciseItemPatterns on ExerciseItem {
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
    TResult Function(_ExerciseItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExerciseItem() when $default != null:
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
    TResult Function(_ExerciseItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExerciseItem():
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
    TResult? Function(_ExerciseItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExerciseItem() when $default != null:
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
    TResult Function(List<String> options, String sentence, String? sound,
            String translation, String solution)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExerciseItem() when $default != null:
        return $default(_that.options, _that.sentence, _that.sound,
            _that.translation, _that.solution);
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
    TResult Function(List<String> options, String sentence, String? sound,
            String translation, String solution)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExerciseItem():
        return $default(_that.options, _that.sentence, _that.sound,
            _that.translation, _that.solution);
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
    TResult? Function(List<String> options, String sentence, String? sound,
            String translation, String solution)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExerciseItem() when $default != null:
        return $default(_that.options, _that.sentence, _that.sound,
            _that.translation, _that.solution);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ExerciseItem implements ExerciseItem {
  const _ExerciseItem(
      {required final List<String> options,
      required this.sentence,
      required this.sound,
      required this.translation,
      required this.solution})
      : _options = options;
  factory _ExerciseItem.fromJson(Map<String, dynamic> json) =>
      _$ExerciseItemFromJson(json);

  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final String sentence;
  @override
  final String? sound;
  @override
  final String translation;
  @override
  final String solution;

  /// Create a copy of ExerciseItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExerciseItemCopyWith<_ExerciseItem> get copyWith =>
      __$ExerciseItemCopyWithImpl<_ExerciseItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExerciseItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExerciseItem &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.sentence, sentence) ||
                other.sentence == sentence) &&
            (identical(other.sound, sound) || other.sound == sound) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.solution, solution) ||
                other.solution == solution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_options),
      sentence,
      sound,
      translation,
      solution);

  @override
  String toString() {
    return 'ExerciseItem(options: $options, sentence: $sentence, sound: $sound, translation: $translation, solution: $solution)';
  }
}

/// @nodoc
abstract mixin class _$ExerciseItemCopyWith<$Res>
    implements $ExerciseItemCopyWith<$Res> {
  factory _$ExerciseItemCopyWith(
          _ExerciseItem value, $Res Function(_ExerciseItem) _then) =
      __$ExerciseItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<String> options,
      String sentence,
      String? sound,
      String translation,
      String solution});
}

/// @nodoc
class __$ExerciseItemCopyWithImpl<$Res>
    implements _$ExerciseItemCopyWith<$Res> {
  __$ExerciseItemCopyWithImpl(this._self, this._then);

  final _ExerciseItem _self;
  final $Res Function(_ExerciseItem) _then;

  /// Create a copy of ExerciseItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? options = null,
    Object? sentence = null,
    Object? sound = freezed,
    Object? translation = null,
    Object? solution = null,
  }) {
    return _then(_ExerciseItem(
      options: null == options
          ? _self._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sentence: null == sentence
          ? _self.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String,
      sound: freezed == sound
          ? _self.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as String?,
      translation: null == translation
          ? _self.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
      solution: null == solution
          ? _self.solution
          : solution // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
