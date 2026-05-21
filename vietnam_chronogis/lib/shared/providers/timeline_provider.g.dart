// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedYear)
final selectedYearProvider = SelectedYearProvider._();

final class SelectedYearProvider extends $NotifierProvider<SelectedYear, int> {
  SelectedYearProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedYearProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedYearHash();

  @$internal
  @override
  SelectedYear create() => SelectedYear();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$selectedYearHash() => r'f2a42af2a07115d30812eeeea793154ab2c81b6e';

abstract class _$SelectedYear extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IsPlaying)
final isPlayingProvider = IsPlayingProvider._();

final class IsPlayingProvider extends $NotifierProvider<IsPlaying, bool> {
  IsPlayingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isPlayingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isPlayingHash();

  @$internal
  @override
  IsPlaying create() => IsPlaying();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isPlayingHash() => r'4f9a8730fa26d135ab583c91d71eb799fd447fed';

abstract class _$IsPlaying extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(currentEra)
final currentEraProvider = CurrentEraProvider._();

final class CurrentEraProvider
    extends $FunctionalProvider<VietnamEra, VietnamEra, VietnamEra>
    with $Provider<VietnamEra> {
  CurrentEraProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentEraProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentEraHash();

  @$internal
  @override
  $ProviderElement<VietnamEra> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VietnamEra create(Ref ref) {
    return currentEra(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VietnamEra value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VietnamEra>(value),
    );
  }
}

String _$currentEraHash() => r'9a939e7edc883600c117587d549aff18f0b01cc6';

@ProviderFor(currentProvinceCount)
final currentProvinceCountProvider = CurrentProvinceCountProvider._();

final class CurrentProvinceCountProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  CurrentProvinceCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentProvinceCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentProvinceCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return currentProvinceCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$currentProvinceCountHash() =>
    r'71e543268c596c84c93e8a5790f5ea9f8078bbea';
