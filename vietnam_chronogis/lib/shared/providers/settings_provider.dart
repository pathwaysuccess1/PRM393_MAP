import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/theme/theme_provider.dart';

const _kGeminiApiKeyKey = 'gemini_api_key';
const _kMapTileLayerKey = 'map_tile_layer';

enum MapTileLayer { openStreetMap, esriSatellite, cartoDbDark }

class SettingsState {
  final String? geminiApiKey;
  final ThemeMode themeMode;
  final MapTileLayer tileLayer;

  const SettingsState({
    this.geminiApiKey,
    this.themeMode = ThemeMode.dark,
    this.tileLayer = MapTileLayer.openStreetMap,
  });

  SettingsState copyWith({
    String? geminiApiKey,
    ThemeMode? themeMode,
    MapTileLayer? tileLayer,
    bool clearApiKey = false,
  }) {
    return SettingsState(
      geminiApiKey: clearApiKey ? null : (geminiApiKey ?? this.geminiApiKey),
      themeMode: themeMode ?? this.themeMode,
      tileLayer: tileLayer ?? this.tileLayer,
    );
  }
}

class SettingsNotifier extends AsyncNotifier<SettingsState> {
  static const _secureStorage = FlutterSecureStorage();

  @override
  Future<SettingsState> build() async {
    final prefs = ref.watch(sharedPreferencesProvider);
    final apiKey = await _secureStorage.read(key: _kGeminiApiKeyKey);
    final tileIndex = prefs.getInt(_kMapTileLayerKey) ?? 0;
    final themeMode = ref.read(themeProvider);

    return SettingsState(
      geminiApiKey: apiKey,
      themeMode: themeMode,
      tileLayer: MapTileLayer.values[tileIndex.clamp(0, MapTileLayer.values.length - 1)],
    );
  }

  Future<void> setGeminiApiKey(String? key) async {
    if (key != null && key.isNotEmpty) {
      await _secureStorage.write(key: _kGeminiApiKeyKey, value: key);
    } else {
      await _secureStorage.delete(key: _kGeminiApiKeyKey);
    }
    state = AsyncData(state.value!.copyWith(
      geminiApiKey: key,
      clearApiKey: key == null || key.isEmpty,
    ));
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    ref.read(themeProvider.notifier).setMode(mode);
    state = AsyncData(state.value!.copyWith(themeMode: mode));
  }

  Future<void> setTileLayer(MapTileLayer layer) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setInt(_kMapTileLayerKey, layer.index);
    state = AsyncData(state.value!.copyWith(tileLayer: layer));
  }
}

final settingsStateProvider =
    AsyncNotifierProvider<SettingsNotifier, SettingsState>(
  SettingsNotifier.new,
);

String tileUrlForLayer(MapTileLayer layer) {
  switch (layer) {
    case MapTileLayer.openStreetMap:
      return 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
    case MapTileLayer.esriSatellite:
      return 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}';
    case MapTileLayer.cartoDbDark:
      return 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png';
  }
}

String tileLayerLabel(MapTileLayer layer) {
  switch (layer) {
    case MapTileLayer.openStreetMap:
      return 'OpenStreetMap';
    case MapTileLayer.esriSatellite:
      return 'Esri Satellite';
    case MapTileLayer.cartoDbDark:
      return 'CartoDB Dark';
  }
}
