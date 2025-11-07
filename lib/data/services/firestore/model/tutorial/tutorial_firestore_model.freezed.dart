// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutorial_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TutorialFirestoreModel {
  String get id;
  @JsonKey(name: 'content_en')
  String get contentEn;
  @JsonKey(name: 'content_ru')
  String get contentRu;
  @JsonKey(name: 'created_at', fromJson: timeFromJson, toJson: timeToJson)
  DateTime get createdAt;
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @JsonKey(name: 'index')
  int get index;
  @JsonKey(name: 'public_en')
  bool get publicEn;
  @JsonKey(name: 'public_ru')
  bool get publicRu;
  @JsonKey(name: 'thumb_url')
  String get thumbUrl;
  @JsonKey(name: 'title_en')
  String get titleEn;
  @JsonKey(name: 'title_ru')
  String get titleRu;
  String? get prevTutorialId;
  String? get nextTutorialId;

  /// Create a copy of TutorialFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TutorialFirestoreModelCopyWith<TutorialFirestoreModel> get copyWith =>
      _$TutorialFirestoreModelCopyWithImpl<TutorialFirestoreModel>(
          this as TutorialFirestoreModel, _$identity);

  /// Serializes this TutorialFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TutorialFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contentEn, contentEn) ||
                other.contentEn == contentEn) &&
            (identical(other.contentRu, contentRu) ||
                other.contentRu == contentRu) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.publicEn, publicEn) ||
                other.publicEn == publicEn) &&
            (identical(other.publicRu, publicRu) ||
                other.publicRu == publicRu) &&
            (identical(other.thumbUrl, thumbUrl) ||
                other.thumbUrl == thumbUrl) &&
            (identical(other.titleEn, titleEn) || other.titleEn == titleEn) &&
            (identical(other.titleRu, titleRu) || other.titleRu == titleRu) &&
            (identical(other.prevTutorialId, prevTutorialId) ||
                other.prevTutorialId == prevTutorialId) &&
            (identical(other.nextTutorialId, nextTutorialId) ||
                other.nextTutorialId == nextTutorialId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      contentEn,
      contentRu,
      createdAt,
      imageUrl,
      index,
      publicEn,
      publicRu,
      thumbUrl,
      titleEn,
      titleRu,
      prevTutorialId,
      nextTutorialId);

  @override
  String toString() {
    return 'TutorialFirestoreModel(id: $id, contentEn: $contentEn, contentRu: $contentRu, createdAt: $createdAt, imageUrl: $imageUrl, index: $index, publicEn: $publicEn, publicRu: $publicRu, thumbUrl: $thumbUrl, titleEn: $titleEn, titleRu: $titleRu, prevTutorialId: $prevTutorialId, nextTutorialId: $nextTutorialId)';
  }
}

/// @nodoc
abstract mixin class $TutorialFirestoreModelCopyWith<$Res> {
  factory $TutorialFirestoreModelCopyWith(TutorialFirestoreModel value,
          $Res Function(TutorialFirestoreModel) _then) =
      _$TutorialFirestoreModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'content_en') String contentEn,
      @JsonKey(name: 'content_ru') String contentRu,
      @JsonKey(name: 'created_at', fromJson: timeFromJson, toJson: timeToJson)
      DateTime createdAt,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'index') int index,
      @JsonKey(name: 'public_en') bool publicEn,
      @JsonKey(name: 'public_ru') bool publicRu,
      @JsonKey(name: 'thumb_url') String thumbUrl,
      @JsonKey(name: 'title_en') String titleEn,
      @JsonKey(name: 'title_ru') String titleRu,
      String? prevTutorialId,
      String? nextTutorialId});
}

/// @nodoc
class _$TutorialFirestoreModelCopyWithImpl<$Res>
    implements $TutorialFirestoreModelCopyWith<$Res> {
  _$TutorialFirestoreModelCopyWithImpl(this._self, this._then);

  final TutorialFirestoreModel _self;
  final $Res Function(TutorialFirestoreModel) _then;

  /// Create a copy of TutorialFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contentEn = null,
    Object? contentRu = null,
    Object? createdAt = null,
    Object? imageUrl = null,
    Object? index = null,
    Object? publicEn = null,
    Object? publicRu = null,
    Object? thumbUrl = null,
    Object? titleEn = null,
    Object? titleRu = null,
    Object? prevTutorialId = freezed,
    Object? nextTutorialId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contentEn: null == contentEn
          ? _self.contentEn
          : contentEn // ignore: cast_nullable_to_non_nullable
              as String,
      contentRu: null == contentRu
          ? _self.contentRu
          : contentRu // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      publicEn: null == publicEn
          ? _self.publicEn
          : publicEn // ignore: cast_nullable_to_non_nullable
              as bool,
      publicRu: null == publicRu
          ? _self.publicRu
          : publicRu // ignore: cast_nullable_to_non_nullable
              as bool,
      thumbUrl: null == thumbUrl
          ? _self.thumbUrl
          : thumbUrl // ignore: cast_nullable_to_non_nullable
              as String,
      titleEn: null == titleEn
          ? _self.titleEn
          : titleEn // ignore: cast_nullable_to_non_nullable
              as String,
      titleRu: null == titleRu
          ? _self.titleRu
          : titleRu // ignore: cast_nullable_to_non_nullable
              as String,
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

/// Adds pattern-matching-related methods to [TutorialFirestoreModel].
extension TutorialFirestoreModelPatterns on TutorialFirestoreModel {
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
    TResult Function(_TutorialFirestoreModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TutorialFirestoreModel() when $default != null:
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
    TResult Function(_TutorialFirestoreModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TutorialFirestoreModel():
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
    TResult? Function(_TutorialFirestoreModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TutorialFirestoreModel() when $default != null:
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
            @JsonKey(name: 'content_en') String contentEn,
            @JsonKey(name: 'content_ru') String contentRu,
            @JsonKey(
                name: 'created_at', fromJson: timeFromJson, toJson: timeToJson)
            DateTime createdAt,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'index') int index,
            @JsonKey(name: 'public_en') bool publicEn,
            @JsonKey(name: 'public_ru') bool publicRu,
            @JsonKey(name: 'thumb_url') String thumbUrl,
            @JsonKey(name: 'title_en') String titleEn,
            @JsonKey(name: 'title_ru') String titleRu,
            String? prevTutorialId,
            String? nextTutorialId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TutorialFirestoreModel() when $default != null:
        return $default(
            _that.id,
            _that.contentEn,
            _that.contentRu,
            _that.createdAt,
            _that.imageUrl,
            _that.index,
            _that.publicEn,
            _that.publicRu,
            _that.thumbUrl,
            _that.titleEn,
            _that.titleRu,
            _that.prevTutorialId,
            _that.nextTutorialId);
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
            @JsonKey(name: 'content_en') String contentEn,
            @JsonKey(name: 'content_ru') String contentRu,
            @JsonKey(
                name: 'created_at', fromJson: timeFromJson, toJson: timeToJson)
            DateTime createdAt,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'index') int index,
            @JsonKey(name: 'public_en') bool publicEn,
            @JsonKey(name: 'public_ru') bool publicRu,
            @JsonKey(name: 'thumb_url') String thumbUrl,
            @JsonKey(name: 'title_en') String titleEn,
            @JsonKey(name: 'title_ru') String titleRu,
            String? prevTutorialId,
            String? nextTutorialId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TutorialFirestoreModel():
        return $default(
            _that.id,
            _that.contentEn,
            _that.contentRu,
            _that.createdAt,
            _that.imageUrl,
            _that.index,
            _that.publicEn,
            _that.publicRu,
            _that.thumbUrl,
            _that.titleEn,
            _that.titleRu,
            _that.prevTutorialId,
            _that.nextTutorialId);
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
            @JsonKey(name: 'content_en') String contentEn,
            @JsonKey(name: 'content_ru') String contentRu,
            @JsonKey(
                name: 'created_at', fromJson: timeFromJson, toJson: timeToJson)
            DateTime createdAt,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'index') int index,
            @JsonKey(name: 'public_en') bool publicEn,
            @JsonKey(name: 'public_ru') bool publicRu,
            @JsonKey(name: 'thumb_url') String thumbUrl,
            @JsonKey(name: 'title_en') String titleEn,
            @JsonKey(name: 'title_ru') String titleRu,
            String? prevTutorialId,
            String? nextTutorialId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TutorialFirestoreModel() when $default != null:
        return $default(
            _that.id,
            _that.contentEn,
            _that.contentRu,
            _that.createdAt,
            _that.imageUrl,
            _that.index,
            _that.publicEn,
            _that.publicRu,
            _that.thumbUrl,
            _that.titleEn,
            _that.titleRu,
            _that.prevTutorialId,
            _that.nextTutorialId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TutorialFirestoreModel implements TutorialFirestoreModel {
  const _TutorialFirestoreModel(
      {required this.id,
      @JsonKey(name: 'content_en') required this.contentEn,
      @JsonKey(name: 'content_ru') required this.contentRu,
      @JsonKey(name: 'created_at', fromJson: timeFromJson, toJson: timeToJson)
      required this.createdAt,
      @JsonKey(name: 'image_url') required this.imageUrl,
      @JsonKey(name: 'index') required this.index,
      @JsonKey(name: 'public_en') required this.publicEn,
      @JsonKey(name: 'public_ru') required this.publicRu,
      @JsonKey(name: 'thumb_url') required this.thumbUrl,
      @JsonKey(name: 'title_en') required this.titleEn,
      @JsonKey(name: 'title_ru') required this.titleRu,
      this.prevTutorialId,
      this.nextTutorialId});
  factory _TutorialFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$TutorialFirestoreModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'content_en')
  final String contentEn;
  @override
  @JsonKey(name: 'content_ru')
  final String contentRu;
  @override
  @JsonKey(name: 'created_at', fromJson: timeFromJson, toJson: timeToJson)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  @JsonKey(name: 'index')
  final int index;
  @override
  @JsonKey(name: 'public_en')
  final bool publicEn;
  @override
  @JsonKey(name: 'public_ru')
  final bool publicRu;
  @override
  @JsonKey(name: 'thumb_url')
  final String thumbUrl;
  @override
  @JsonKey(name: 'title_en')
  final String titleEn;
  @override
  @JsonKey(name: 'title_ru')
  final String titleRu;
  @override
  final String? prevTutorialId;
  @override
  final String? nextTutorialId;

  /// Create a copy of TutorialFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TutorialFirestoreModelCopyWith<_TutorialFirestoreModel> get copyWith =>
      __$TutorialFirestoreModelCopyWithImpl<_TutorialFirestoreModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TutorialFirestoreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TutorialFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contentEn, contentEn) ||
                other.contentEn == contentEn) &&
            (identical(other.contentRu, contentRu) ||
                other.contentRu == contentRu) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.publicEn, publicEn) ||
                other.publicEn == publicEn) &&
            (identical(other.publicRu, publicRu) ||
                other.publicRu == publicRu) &&
            (identical(other.thumbUrl, thumbUrl) ||
                other.thumbUrl == thumbUrl) &&
            (identical(other.titleEn, titleEn) || other.titleEn == titleEn) &&
            (identical(other.titleRu, titleRu) || other.titleRu == titleRu) &&
            (identical(other.prevTutorialId, prevTutorialId) ||
                other.prevTutorialId == prevTutorialId) &&
            (identical(other.nextTutorialId, nextTutorialId) ||
                other.nextTutorialId == nextTutorialId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      contentEn,
      contentRu,
      createdAt,
      imageUrl,
      index,
      publicEn,
      publicRu,
      thumbUrl,
      titleEn,
      titleRu,
      prevTutorialId,
      nextTutorialId);

  @override
  String toString() {
    return 'TutorialFirestoreModel(id: $id, contentEn: $contentEn, contentRu: $contentRu, createdAt: $createdAt, imageUrl: $imageUrl, index: $index, publicEn: $publicEn, publicRu: $publicRu, thumbUrl: $thumbUrl, titleEn: $titleEn, titleRu: $titleRu, prevTutorialId: $prevTutorialId, nextTutorialId: $nextTutorialId)';
  }
}

/// @nodoc
abstract mixin class _$TutorialFirestoreModelCopyWith<$Res>
    implements $TutorialFirestoreModelCopyWith<$Res> {
  factory _$TutorialFirestoreModelCopyWith(_TutorialFirestoreModel value,
          $Res Function(_TutorialFirestoreModel) _then) =
      __$TutorialFirestoreModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'content_en') String contentEn,
      @JsonKey(name: 'content_ru') String contentRu,
      @JsonKey(name: 'created_at', fromJson: timeFromJson, toJson: timeToJson)
      DateTime createdAt,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'index') int index,
      @JsonKey(name: 'public_en') bool publicEn,
      @JsonKey(name: 'public_ru') bool publicRu,
      @JsonKey(name: 'thumb_url') String thumbUrl,
      @JsonKey(name: 'title_en') String titleEn,
      @JsonKey(name: 'title_ru') String titleRu,
      String? prevTutorialId,
      String? nextTutorialId});
}

/// @nodoc
class __$TutorialFirestoreModelCopyWithImpl<$Res>
    implements _$TutorialFirestoreModelCopyWith<$Res> {
  __$TutorialFirestoreModelCopyWithImpl(this._self, this._then);

  final _TutorialFirestoreModel _self;
  final $Res Function(_TutorialFirestoreModel) _then;

  /// Create a copy of TutorialFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? contentEn = null,
    Object? contentRu = null,
    Object? createdAt = null,
    Object? imageUrl = null,
    Object? index = null,
    Object? publicEn = null,
    Object? publicRu = null,
    Object? thumbUrl = null,
    Object? titleEn = null,
    Object? titleRu = null,
    Object? prevTutorialId = freezed,
    Object? nextTutorialId = freezed,
  }) {
    return _then(_TutorialFirestoreModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contentEn: null == contentEn
          ? _self.contentEn
          : contentEn // ignore: cast_nullable_to_non_nullable
              as String,
      contentRu: null == contentRu
          ? _self.contentRu
          : contentRu // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      publicEn: null == publicEn
          ? _self.publicEn
          : publicEn // ignore: cast_nullable_to_non_nullable
              as bool,
      publicRu: null == publicRu
          ? _self.publicRu
          : publicRu // ignore: cast_nullable_to_non_nullable
              as bool,
      thumbUrl: null == thumbUrl
          ? _self.thumbUrl
          : thumbUrl // ignore: cast_nullable_to_non_nullable
              as String,
      titleEn: null == titleEn
          ? _self.titleEn
          : titleEn // ignore: cast_nullable_to_non_nullable
              as String,
      titleRu: null == titleRu
          ? _self.titleRu
          : titleRu // ignore: cast_nullable_to_non_nullable
              as String,
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
