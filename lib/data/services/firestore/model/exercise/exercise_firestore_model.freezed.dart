// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExerciseFirestoreModel {
  String get id;
  String get description;
  String get example;
  List<Map<String, dynamic>> get items;
  @JsonKey(name: 'order_number')
  int get orderNumber;
  @JsonKey(name: 'example_translation')
  String? get exampleTranslation;

  /// Create a copy of ExerciseFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExerciseFirestoreModelCopyWith<ExerciseFirestoreModel> get copyWith =>
      _$ExerciseFirestoreModelCopyWithImpl<ExerciseFirestoreModel>(
          this as ExerciseFirestoreModel, _$identity);

  /// Serializes this ExerciseFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExerciseFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.example, example) || other.example == example) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.exampleTranslation, exampleTranslation) ||
                other.exampleTranslation == exampleTranslation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      description,
      example,
      const DeepCollectionEquality().hash(items),
      orderNumber,
      exampleTranslation);

  @override
  String toString() {
    return 'ExerciseFirestoreModel(id: $id, description: $description, example: $example, items: $items, orderNumber: $orderNumber, exampleTranslation: $exampleTranslation)';
  }
}

/// @nodoc
abstract mixin class $ExerciseFirestoreModelCopyWith<$Res> {
  factory $ExerciseFirestoreModelCopyWith(ExerciseFirestoreModel value,
          $Res Function(ExerciseFirestoreModel) _then) =
      _$ExerciseFirestoreModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String description,
      String example,
      List<Map<String, dynamic>> items,
      @JsonKey(name: 'order_number') int orderNumber,
      @JsonKey(name: 'example_translation') String? exampleTranslation});
}

/// @nodoc
class _$ExerciseFirestoreModelCopyWithImpl<$Res>
    implements $ExerciseFirestoreModelCopyWith<$Res> {
  _$ExerciseFirestoreModelCopyWithImpl(this._self, this._then);

  final ExerciseFirestoreModel _self;
  final $Res Function(ExerciseFirestoreModel) _then;

  /// Create a copy of ExerciseFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? example = null,
    Object? items = null,
    Object? orderNumber = null,
    Object? exampleTranslation = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      example: null == example
          ? _self.example
          : example // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as int,
      exampleTranslation: freezed == exampleTranslation
          ? _self.exampleTranslation
          : exampleTranslation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ExerciseFirestoreModel].
extension ExerciseFirestoreModelPatterns on ExerciseFirestoreModel {
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
    TResult Function(_ExerciseFirestoreModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExerciseFirestoreModel() when $default != null:
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
    TResult Function(_ExerciseFirestoreModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExerciseFirestoreModel():
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
    TResult? Function(_ExerciseFirestoreModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExerciseFirestoreModel() when $default != null:
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
            String id,
            String description,
            String example,
            List<Map<String, dynamic>> items,
            @JsonKey(name: 'order_number') int orderNumber,
            @JsonKey(name: 'example_translation') String? exampleTranslation)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExerciseFirestoreModel() when $default != null:
        return $default(_that.id, _that.description, _that.example, _that.items,
            _that.orderNumber, _that.exampleTranslation);
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
            String id,
            String description,
            String example,
            List<Map<String, dynamic>> items,
            @JsonKey(name: 'order_number') int orderNumber,
            @JsonKey(name: 'example_translation') String? exampleTranslation)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExerciseFirestoreModel():
        return $default(_that.id, _that.description, _that.example, _that.items,
            _that.orderNumber, _that.exampleTranslation);
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
            String id,
            String description,
            String example,
            List<Map<String, dynamic>> items,
            @JsonKey(name: 'order_number') int orderNumber,
            @JsonKey(name: 'example_translation') String? exampleTranslation)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExerciseFirestoreModel() when $default != null:
        return $default(_that.id, _that.description, _that.example, _that.items,
            _that.orderNumber, _that.exampleTranslation);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ExerciseFirestoreModel implements ExerciseFirestoreModel {
  const _ExerciseFirestoreModel(
      {required this.id,
      required this.description,
      required this.example,
      required final List<Map<String, dynamic>> items,
      @JsonKey(name: 'order_number') required this.orderNumber,
      @JsonKey(name: 'example_translation') this.exampleTranslation})
      : _items = items;
  factory _ExerciseFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFirestoreModelFromJson(json);

  @override
  final String id;
  @override
  final String description;
  @override
  final String example;
  final List<Map<String, dynamic>> _items;
  @override
  List<Map<String, dynamic>> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'order_number')
  final int orderNumber;
  @override
  @JsonKey(name: 'example_translation')
  final String? exampleTranslation;

  /// Create a copy of ExerciseFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExerciseFirestoreModelCopyWith<_ExerciseFirestoreModel> get copyWith =>
      __$ExerciseFirestoreModelCopyWithImpl<_ExerciseFirestoreModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExerciseFirestoreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExerciseFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.example, example) || other.example == example) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.exampleTranslation, exampleTranslation) ||
                other.exampleTranslation == exampleTranslation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      description,
      example,
      const DeepCollectionEquality().hash(_items),
      orderNumber,
      exampleTranslation);

  @override
  String toString() {
    return 'ExerciseFirestoreModel(id: $id, description: $description, example: $example, items: $items, orderNumber: $orderNumber, exampleTranslation: $exampleTranslation)';
  }
}

/// @nodoc
abstract mixin class _$ExerciseFirestoreModelCopyWith<$Res>
    implements $ExerciseFirestoreModelCopyWith<$Res> {
  factory _$ExerciseFirestoreModelCopyWith(_ExerciseFirestoreModel value,
          $Res Function(_ExerciseFirestoreModel) _then) =
      __$ExerciseFirestoreModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String description,
      String example,
      List<Map<String, dynamic>> items,
      @JsonKey(name: 'order_number') int orderNumber,
      @JsonKey(name: 'example_translation') String? exampleTranslation});
}

/// @nodoc
class __$ExerciseFirestoreModelCopyWithImpl<$Res>
    implements _$ExerciseFirestoreModelCopyWith<$Res> {
  __$ExerciseFirestoreModelCopyWithImpl(this._self, this._then);

  final _ExerciseFirestoreModel _self;
  final $Res Function(_ExerciseFirestoreModel) _then;

  /// Create a copy of ExerciseFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? example = null,
    Object? items = null,
    Object? orderNumber = null,
    Object? exampleTranslation = freezed,
  }) {
    return _then(_ExerciseFirestoreModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      example: null == example
          ? _self.example
          : example // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as int,
      exampleTranslation: freezed == exampleTranslation
          ? _self.exampleTranslation
          : exampleTranslation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
