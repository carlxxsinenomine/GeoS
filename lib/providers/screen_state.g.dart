// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ScreenState)
final screenStateProvider = ScreenStateProvider._();

final class ScreenStateProvider
    extends $NotifierProvider<ScreenState, NavMode> {
  ScreenStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'screenStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$screenStateHash();

  @$internal
  @override
  ScreenState create() => ScreenState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NavMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NavMode>(value),
    );
  }
}

String _$screenStateHash() => r'ec701200b4a927edf154cbb7e32828b48f2f8e2c';

abstract class _$ScreenState extends $Notifier<NavMode> {
  NavMode build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<NavMode, NavMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NavMode, NavMode>,
              NavMode,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
