// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Exercise {
  String get id;
  List<ExerciseItem>? get items;
  String? get description;
  String? get exampleTranslation;
  String? get example;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExerciseCopyWith<Exercise> get copyWith =>
      _$ExerciseCopyWithImpl<Exercise>(this as Exercise, _$identity);

  /// Serializes this Exercise to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Exercise &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.exampleTranslation, exampleTranslation) ||
                other.exampleTranslation == exampleTranslation) &&
            (identical(other.example, example) || other.example == example));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(items),
      description,
      exampleTranslation,
      example);

  @override
  String toString() {
    return 'Exercise(id: $id, items: $items, description: $description, exampleTranslation: $exampleTranslation, example: $example)';
  }
}

/// @nodoc
abstract mixin class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) _then) =
      _$ExerciseCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      List<ExerciseItem>? items,
      String? description,
      String? exampleTranslation,
      String? example});
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res> implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._self, this._then);

  final Exercise _self;
  final $Res Function(Exercise) _then;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = freezed,
    Object? description = freezed,
    Object? exampleTranslation = freezed,
    Object? example = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: freezed == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ExerciseItem>?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      exampleTranslation: freezed == exampleTranslation
          ? _self.exampleTranslation
          : exampleTranslation // ignore: cast_nullable_to_non_nullable
              as String?,
      example: freezed == example
          ? _self.example
          : example // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Exercise].
extension ExercisePatterns on Exercise {
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
    TResult Function(_Exercise value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Exercise() when $default != null:
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
    TResult Function(_Exercise value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Exercise():
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
    TResult? Function(_Exercise value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Exercise() when $default != null:
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
    TResult Function(String id, List<ExerciseItem>? items, String? description,
            String? exampleTranslation, String? example)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Exercise() when $default != null:
        return $default(_that.id, _that.items, _that.description,
            _that.exampleTranslation, _that.example);
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
    TResult Function(String id, List<ExerciseItem>? items, String? description,
            String? exampleTranslation, String? example)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Exercise():
        return $default(_that.id, _that.items, _that.description,
            _that.exampleTranslation, _that.example);
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
    TResult? Function(String id, List<ExerciseItem>? items, String? description,
            String? exampleTranslation, String? example)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Exercise() when $default != null:
        return $default(_that.id, _that.items, _that.description,
            _that.exampleTranslation, _that.example);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Exercise implements Exercise {
  const _Exercise(
      {required this.id,
      required final List<ExerciseItem>? items,
      required this.description,
      required this.exampleTranslation,
      required this.example})
      : _items = items;
  factory _Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  @override
  final String id;
  final List<ExerciseItem>? _items;
  @override
  List<ExerciseItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? description;
  @override
  final String? exampleTranslation;
  @override
  final String? example;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExerciseCopyWith<_Exercise> get copyWith =>
      __$ExerciseCopyWithImpl<_Exercise>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExerciseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Exercise &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.exampleTranslation, exampleTranslation) ||
                other.exampleTranslation == exampleTranslation) &&
            (identical(other.example, example) || other.example == example));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_items),
      description,
      exampleTranslation,
      example);

  @override
  String toString() {
    return 'Exercise(id: $id, items: $items, description: $description, exampleTranslation: $exampleTranslation, example: $example)';
  }
}

/// @nodoc
abstract mixin class _$ExerciseCopyWith<$Res>
    implements $ExerciseCopyWith<$Res> {
  factory _$ExerciseCopyWith(_Exercise value, $Res Function(_Exercise) _then) =
      __$ExerciseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      List<ExerciseItem>? items,
      String? description,
      String? exampleTranslation,
      String? example});
}

/// @nodoc
class __$ExerciseCopyWithImpl<$Res> implements _$ExerciseCopyWith<$Res> {
  __$ExerciseCopyWithImpl(this._self, this._then);

  final _Exercise _self;
  final $Res Function(_Exercise) _then;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? items = freezed,
    Object? description = freezed,
    Object? exampleTranslation = freezed,
    Object? example = freezed,
  }) {
    return _then(_Exercise(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: freezed == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ExerciseItem>?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      exampleTranslation: freezed == exampleTranslation
          ? _self.exampleTranslation
          : exampleTranslation // ignore: cast_nullable_to_non_nullable
              as String?,
      example: freezed == example
          ? _self.example
          : example // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
