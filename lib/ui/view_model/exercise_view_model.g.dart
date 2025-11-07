// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$exerciseViewModelHash() => r'49031eaac1755440879e264de75106a904ec0032';

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
  late final ExerciseViewModelParams params;

  FutureOr<ExerciseUiState> build(
    ExerciseViewModelParams params,
  );
}

/// See also [ExerciseViewModel].
@ProviderFor(ExerciseViewModel)
const exerciseViewModelProvider = ExerciseViewModelFamily();

/// See also [ExerciseViewModel].
class ExerciseViewModelFamily extends Family<AsyncValue<ExerciseUiState>> {
  /// See also [ExerciseViewModel].
  const ExerciseViewModelFamily();

  /// See also [ExerciseViewModel].
  ExerciseViewModelProvider call(
    ExerciseViewModelParams params,
  ) {
    return ExerciseViewModelProvider(
      params,
    );
  }

  @override
  ExerciseViewModelProvider getProviderOverride(
    covariant ExerciseViewModelProvider provider,
  ) {
    return call(
      provider.params,
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
  ExerciseViewModelProvider(
    ExerciseViewModelParams params,
  ) : this._internal(
          () => ExerciseViewModel()..params = params,
          from: exerciseViewModelProvider,
          name: r'exerciseViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exerciseViewModelHash,
          dependencies: ExerciseViewModelFamily._dependencies,
          allTransitiveDependencies:
              ExerciseViewModelFamily._allTransitiveDependencies,
          params: params,
        );

  ExerciseViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final ExerciseViewModelParams params;

  @override
  FutureOr<ExerciseUiState> runNotifierBuild(
    covariant ExerciseViewModel notifier,
  ) {
    return notifier.build(
      params,
    );
  }

  @override
  Override overrideWith(ExerciseViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExerciseViewModelProvider._internal(
        () => create()..params = params,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
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
    return other is ExerciseViewModelProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExerciseViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<ExerciseUiState> {
  /// The parameter `params` of this provider.
  ExerciseViewModelParams get params;
}

class _ExerciseViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ExerciseViewModel,
        ExerciseUiState> with ExerciseViewModelRef {
  _ExerciseViewModelProviderElement(super.provider);

  @override
  ExerciseViewModelParams get params =>
      (origin as ExerciseViewModelProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
