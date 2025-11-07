// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tutorialViewModelHash() => r'ff8fcb1a9cb7db16dde0537ea7ee2595579420de';

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

abstract class _$TutorialViewModel
    extends BuildlessAutoDisposeAsyncNotifier<TutorialUiState> {
  late final String tutorialId;

  FutureOr<TutorialUiState> build(
    String tutorialId,
  );
}

/// See also [TutorialViewModel].
@ProviderFor(TutorialViewModel)
const tutorialViewModelProvider = TutorialViewModelFamily();

/// See also [TutorialViewModel].
class TutorialViewModelFamily extends Family<AsyncValue<TutorialUiState>> {
  /// See also [TutorialViewModel].
  const TutorialViewModelFamily();

  /// See also [TutorialViewModel].
  TutorialViewModelProvider call(
    String tutorialId,
  ) {
    return TutorialViewModelProvider(
      tutorialId,
    );
  }

  @override
  TutorialViewModelProvider getProviderOverride(
    covariant TutorialViewModelProvider provider,
  ) {
    return call(
      provider.tutorialId,
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
  String? get name => r'tutorialViewModelProvider';
}

/// See also [TutorialViewModel].
class TutorialViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    TutorialViewModel, TutorialUiState> {
  /// See also [TutorialViewModel].
  TutorialViewModelProvider(
    String tutorialId,
  ) : this._internal(
          () => TutorialViewModel()..tutorialId = tutorialId,
          from: tutorialViewModelProvider,
          name: r'tutorialViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tutorialViewModelHash,
          dependencies: TutorialViewModelFamily._dependencies,
          allTransitiveDependencies:
              TutorialViewModelFamily._allTransitiveDependencies,
          tutorialId: tutorialId,
        );

  TutorialViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tutorialId,
  }) : super.internal();

  final String tutorialId;

  @override
  FutureOr<TutorialUiState> runNotifierBuild(
    covariant TutorialViewModel notifier,
  ) {
    return notifier.build(
      tutorialId,
    );
  }

  @override
  Override overrideWith(TutorialViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: TutorialViewModelProvider._internal(
        () => create()..tutorialId = tutorialId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tutorialId: tutorialId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TutorialViewModel, TutorialUiState>
      createElement() {
    return _TutorialViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TutorialViewModelProvider && other.tutorialId == tutorialId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tutorialId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TutorialViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<TutorialUiState> {
  /// The parameter `tutorialId` of this provider.
  String get tutorialId;
}

class _TutorialViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TutorialViewModel,
        TutorialUiState> with TutorialViewModelRef {
  _TutorialViewModelProviderElement(super.provider);

  @override
  String get tutorialId => (origin as TutorialViewModelProvider).tutorialId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
