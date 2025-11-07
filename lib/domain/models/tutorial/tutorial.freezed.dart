// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutorial.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Tutorial {
  String get id;
  String get title;
  String? get thumbUrl;
  String? get imageUrl;
  String? get content;
  String? get prevTutorialId;
  String? get nextTutorialId;

  /// Create a copy of Tutorial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TutorialCopyWith<Tutorial> get copyWith =>
      _$TutorialCopyWithImpl<Tutorial>(this as Tutorial, _$identity);

  /// Serializes this Tutorial to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Tutorial &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbUrl, thumbUrl) ||
                other.thumbUrl == thumbUrl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.prevTutorialId, prevTutorialId) ||
                other.prevTutorialId == prevTutorialId) &&
            (identical(other.nextTutorialId, nextTutorialId) ||
                other.nextTutorialId == nextTutorialId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, thumbUrl, imageUrl,
      content, prevTutorialId, nextTutorialId);

  @override
  String toString() {
    return 'Tutorial(id: $id, title: $title, thumbUrl: $thumbUrl, imageUrl: $imageUrl, content: $content, prevTutorialId: $prevTutorialId, nextTutorialId: $nextTutorialId)';
  }
}

/// @nodoc
abstract mixin class $TutorialCopyWith<$Res> {
  factory $TutorialCopyWith(Tutorial value, $Res Function(Tutorial) _then) =
      _$TutorialCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String? thumbUrl,
      String? imageUrl,
      String? content,
      String? prevTutorialId,
      String? nextTutorialId});
}

/// @nodoc
class _$TutorialCopyWithImpl<$Res> implements $TutorialCopyWith<$Res> {
  _$TutorialCopyWithImpl(this._self, this._then);

  final Tutorial _self;
  final $Res Function(Tutorial) _then;

  /// Create a copy of Tutorial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumbUrl = freezed,
    Object? imageUrl = freezed,
    Object? content = freezed,
    Object? prevTutorialId = freezed,
    Object? nextTutorialId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbUrl: freezed == thumbUrl
          ? _self.thumbUrl
          : thumbUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      prevTutorialId: freezed == prevTutorialId
          ? _self.prevTutorialId
          : prevTutorialId // ignore: cast_nullable_to_non_nullable
              as String?,
      nextTutorialId: freezed == nextTutorialId
          ? _self.nextTutorialId
          : nextTutorialId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Tutorial].
extension TutorialPatterns on Tutorial {
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
    TResult Function(_Tutorial value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Tutorial() when $default != null:
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
    TResult Function(_Tutorial value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tutorial():
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
    TResult? Function(_Tutorial value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tutorial() when $default != null:
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
            String title,
            String? thumbUrl,
            String? imageUrl,
            String? content,
            String? prevTutorialId,
            String? nextTutorialId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Tutorial() when $default != null:
        return $default(_that.id, _that.title, _that.thumbUrl, _that.imageUrl,
            _that.content, _that.prevTutorialId, _that.nextTutorialId);
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
            String title,
            String? thumbUrl,
            String? imageUrl,
            String? content,
            String? prevTutorialId,
            String? nextTutorialId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tutorial():
        return $default(_that.id, _that.title, _that.thumbUrl, _that.imageUrl,
            _that.content, _that.prevTutorialId, _that.nextTutorialId);
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
            String title,
            String? thumbUrl,
            String? imageUrl,
            String? content,
            String? prevTutorialId,
            String? nextTutorialId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tutorial() when $default != null:
        return $default(_that.id, _that.title, _that.thumbUrl, _that.imageUrl,
            _that.content, _that.prevTutorialId, _that.nextTutorialId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Tutorial implements Tutorial {
  const _Tutorial(
      {required this.id,
      required this.title,
      required this.thumbUrl,
      required this.imageUrl,
      required this.content,
      required this.prevTutorialId,
      required this.nextTutorialId});
  factory _Tutorial.fromJson(Map<String, dynamic> json) =>
      _$TutorialFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? thumbUrl;
  @override
  final String? imageUrl;
  @override
  final String? content;
  @override
  final String? prevTutorialId;
  @override
  final String? nextTutorialId;

  /// Create a copy of Tutorial
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TutorialCopyWith<_Tutorial> get copyWith =>
      __$TutorialCopyWithImpl<_Tutorial>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TutorialToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Tutorial &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbUrl, thumbUrl) ||
                other.thumbUrl == thumbUrl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.prevTutorialId, prevTutorialId) ||
                other.prevTutorialId == prevTutorialId) &&
            (identical(other.nextTutorialId, nextTutorialId) ||
                other.nextTutorialId == nextTutorialId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, thumbUrl, imageUrl,
      content, prevTutorialId, nextTutorialId);

  @override
  String toString() {
    return 'Tutorial(id: $id, title: $title, thumbUrl: $thumbUrl, imageUrl: $imageUrl, content: $content, prevTutorialId: $prevTutorialId, nextTutorialId: $nextTutorialId)';
  }
}

/// @nodoc
abstract mixin class _$TutorialCopyWith<$Res>
    implements $TutorialCopyWith<$Res> {
  factory _$TutorialCopyWith(_Tutorial value, $Res Function(_Tutorial) _then) =
      __$TutorialCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? thumbUrl,
      String? imageUrl,
      String? content,
      String? prevTutorialId,
      String? nextTutorialId});
}

/// @nodoc
class __$TutorialCopyWithImpl<$Res> implements _$TutorialCopyWith<$Res> {
  __$TutorialCopyWithImpl(this._self, this._then);

  final _Tutorial _self;
  final $Res Function(_Tutorial) _then;

  /// Create a copy of Tutorial
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumbUrl = freezed,
    Object? imageUrl = freezed,
    Object? content = freezed,
    Object? prevTutorialId = freezed,
    Object? nextTutorialId = freezed,
  }) {
    return _then(_Tutorial(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbUrl: freezed == thumbUrl
          ? _self.thumbUrl
          : thumbUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      prevTutorialId: freezed == prevTutorialId
          ? _self.prevTutorialId
          : prevTutorialId // ignore: cast_nullable_to_non_nullable
              as String?,
      nextTutorialId: freezed == nextTutorialId
          ? _self.nextTutorialId
          : nextTutorialId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
