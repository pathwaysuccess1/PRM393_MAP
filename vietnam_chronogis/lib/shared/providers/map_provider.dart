import 'package:flutter_map/flutter_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_provider.g.dart';

@riverpod
class SelectedProvince extends _$SelectedProvince {
  @override
  String? build() {
    return null;
  }

  void select(String ma) {
    state = ma;
  }

  void clear() {
    state = null;
  }
}

enum MapTileStyle { street, satellite }

@riverpod
class MapTileStyleState extends _$MapTileStyleState {
  @override
  MapTileStyle build() {
    return MapTileStyle.street;
  }

  void toggle() {
    state = state == MapTileStyle.street
        ? MapTileStyle.satellite
        : MapTileStyle.street;
  }
}

@riverpod
class ShowBordersState extends _$ShowBordersState {
  @override
  bool build() {
    return true;
  }

  void toggle() {
    state = !state;
  }
}

@riverpod
class MapControllerState extends _$MapControllerState {
  @override
  MapController build() {
    return MapController();
  }
}
