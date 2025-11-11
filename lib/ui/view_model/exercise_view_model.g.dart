// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$exerciseViewModelHash() => r'1c7d66b86c90645d74f30d20d451c7456ed66777';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ExerciseViewModel
    extends BuildlessAutoDisposeAsyncNotifier<ExerciseUiState> {
  late final String tutorialId;
  late final String languageCode;
  late final String exerciseId;

  FutureOr<ExerciseUiState> build({
    required String tutorialId,
    required String languageCode,
    required String exerciseId,
  });
}

/// See also [ExerciseViewModel].
@ProviderFor(ExerciseViewModel)
const exerciseViewModelProvider = ExerciseViewModelFamily();

/// See also [ExerciseViewModel].
class ExerciseViewModelFamily extends Family<AsyncValue<ExerciseUiState>> {
  /// See also [ExerciseViewModel].
  const ExerciseViewModelFamily();

  /// See also [ExerciseViewModel].
  ExerciseViewModelProvider call({
    required String tutorialId,
    required String languageCode,
    required String exerciseId,
  }) {
    return ExerciseViewModelProvider(
      tutorialId: tutorialId,
      languageCode: languageCode,
      exerciseId: exerciseId,
    );
  }

  @override
  ExerciseViewModelProvider getProviderOverride(
    covariant ExerciseViewModelProvider provider,
  ) {
    return call(
      tutorialId: provider.tutorialId,
      languageCode: provider.languageCode,
      exerciseId: provider.exerciseId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exerciseViewModelProvider';
}

/// See also [ExerciseViewModel].
class ExerciseViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ExerciseViewModel, ExerciseUiState> {
  /// See also [ExerciseViewModel].
  ExerciseViewModelProvider({
    required String tutorialId,
    required String languageCode,
    required String exerciseId,
  }) : this._internal(
          () => ExerciseViewModel()
            ..tutorialId = tutorialId
            ..languageCode = languageCode
            ..exerciseId = exerciseId,
          from: exerciseViewModelProvider,
          name: r'exerciseViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exerciseViewModelHash,
          dependencies: ExerciseViewModelFamily._dependencies,
          allTransitiveDependencies:
              ExerciseViewModelFamily._allTransitiveDependencies,
          tutorialId: tutorialId,
          languageCode: languageCode,
          exerciseId: exerciseId,
        );

  ExerciseViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tutorialId,
    required this.languageCode,
    required this.exerciseId,
  }) : super.internal();

  final String tutorialId;
  final String languageCode;
  final String exerciseId;

  @override
  FutureOr<ExerciseUiState> runNotifierBuild(
    covariant ExerciseViewModel notifier,
  ) {
    return notifier.build(
      tutorialId: tutorialId,
      languageCode: languageCode,
      exerciseId: exerciseId,
    );
  }

  @override
  Override overrideWith(ExerciseViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExerciseViewModelProvider._internal(
        () => create()
          ..tutorialId = tutorialId
          ..languageCode = languageCode
          ..exerciseId = exerciseId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tutorialId: tutorialId,
        languageCode: languageCode,
        exerciseId: exerciseId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ExerciseViewModel, ExerciseUiState>
      createElement() {
    return _ExerciseViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExerciseViewModelProvider &&
        other.tutorialId == tutorialId &&
        other.languageCode == languageCode &&
        other.exerciseId == exerciseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tutorialId.hashCode);
    hash = _SystemHash.combine(hash, languageCode.hashCode);
    hash = _SystemHash.combine(hash, exerciseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExerciseViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<ExerciseUiState> {
  /// The parameter `tutorialId` of this provider.
  String get tutorialId;

  /// The parameter `languageCode` of this provider.
  String get languageCode;

  /// The parameter `exerciseId` of this provider.
  String get exerciseId;
}

class _ExerciseViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ExerciseViewModel,
        ExerciseUiState> with ExerciseViewModelRef {
  _ExerciseViewModelProviderElement(super.provider);

  @override
  String get tutorialId => (origin as ExerciseViewModelProvider).tutorialId;
  @override
  String get languageCode => (origin as ExerciseViewModelProvider).languageCode;
  @override
  String get exerciseId => (origin as ExerciseViewModelProvider).exerciseId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
