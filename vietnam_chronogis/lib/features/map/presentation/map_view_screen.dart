import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

// FIX: import DAO providers trực tiếp thay vì repository
import '../../../shared/providers/database_provider.dart';
import '../../../shared/providers/map_provider.dart';
import '../../../shared/providers/timeline_provider.dart';
import '../../../core/database/app_database.dart';
import 'widgets/map_controls_widget.dart';
import 'widgets/province_info_popup.dart';

class ProvinceGeometry {
  final AdministrativeUnit province;
  final List<List<LatLng>> polygons;
  ProvinceGeometry(this.province, this.polygons);
}

final provinceGeometriesProvider = FutureProvider<List<ProvinceGeometry>>((ref) async {
  final unitDao = ref.watch(administrativeUnitDaoProvider);
  final geoJsonDao = ref.watch(geoJsonDaoProvider);

  final provinces = await unitDao.getAllProvinces();
  final List<ProvinceGeometry> results = [];

  for (final province in provinces) {
    final cached = await geoJsonDao.getGeoJsonByMa(province.ma);
    if (cached == null) continue;

    try {
      final decoded = jsonDecode(cached.geoJsonData) as List<dynamic>;
      final List<List<LatLng>> polyPoints = [];

      for (final polyRaw in decoded) {
        if (polyRaw is! List || polyRaw.isEmpty) continue;
        final outerRing = polyRaw[0];
        if (outerRing is! List || outerRing.isEmpty) continue;

        final List<LatLng> points = [];
        for (final pt in outerRing) {
          if (pt is List && pt.length >= 2) {
            final lat = (pt[0] as num).toDouble();
            final lon = (pt[1] as num).toDouble();
            points.add(LatLng(lat, lon));
          }
        }
        if (points.isNotEmpty) {
          polyPoints.add(points);
        }
      }
      if (polyPoints.isNotEmpty) {
        results.add(ProvinceGeometry(province, polyPoints));
      }
    } catch (e) {
      debugPrint('Error parsing polygon for ${province.ma}: $e');
    }
  }
  return results;
});

final mapPolygonsProvider = Provider<AsyncValue<List<Polygon>>>((ref) {
  final geometriesAsync = ref.watch(provinceGeometriesProvider);
  final showBorders = ref.watch(showBordersStateProvider);
  final showHeatmap = ref.watch(showHeatmapStateProvider);
  final selectedMa = ref.watch(selectedProvinceProvider);

  return geometriesAsync.whenData((geometries) {
    final List<Polygon> polygons = [];
    for (final geom in geometries) {
      final province = geom.province;
      final isSelected = selectedMa == province.ma;
      
      final baseColor = showHeatmap 
          ? _getHeatmapColorForDensity(province.density)
          : _getColorForRegion(province.macroRegion);
          
      final fillColor = baseColor.withValues(alpha: isSelected ? 0.6 : 0.35);
      final borderColor =
          isSelected ? Colors.white : Colors.white.withValues(alpha: 0.4);
      final borderThickness =
          isSelected ? 2.0 : (showBorders ? 1.0 : 0.0);

      for (final points in geom.polygons) {
        polygons.add(Polygon(
          points: points,
          color: fillColor,
          borderColor: borderColor,
          borderStrokeWidth: borderThickness,
        ));
      }
    }
    return polygons;
  });
});

Color _getColorForRegion(String? macroRegion) {
  switch (macroRegion) {
    case 'red_river_delta':
      return const Color(0xFF2D5A8E);
    case 'northern_midlands':
      return const Color(0xFF378ADD);
    case 'central_coast':
      return const Color(0xFF1D9E75);
    case 'central_highlands':
      return const Color(0xFFBA7517);
    case 'southeast':
      return const Color(0xFFE24B4A);
    case 'mekong_delta':
      return const Color(0xFF534AB7);
    default:
      return const Color(0xFF888780);
  }
}

Color _getHeatmapColorForDensity(double? density) {
  if (density == null || density <= 0) return const Color(0xFFE5E5E5); // Grey for unknown
  if (density < 100) return const Color(0xFFFFEDA0); // Light Yellow
  if (density < 250) return const Color(0xFFFEB24C); // Yellow-Orange
  if (density < 500) return const Color(0xFFFD8D3C); // Orange
  if (density < 1000) return const Color(0xFFFC4E2A); // Orange-Red
  if (density < 2000) return const Color(0xFFE31A1C); // Red
  return const Color(0xFFB10026); // Dark Red
}

class MapViewScreen extends ConsumerWidget {
  const MapViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerStateProvider);
    final mapStyle = ref.watch(mapTileStyleStateProvider);
    final polygonsAsync = ref.watch(mapPolygonsProvider);
    final selectedYear = ref.watch(selectedYearProvider);

    final tileUrl = mapStyle == MapTileStyle.street
        ? 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'
        : 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}';

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: const LatLng(16.0, 106.0),
              initialZoom: 5.5,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all,
              ),
              onTap: (tapPosition, point) {
                ref.read(selectedProvinceProvider.notifier).clear();
              },
            ),
            children: [
              TileLayer(
                urlTemplate: tileUrl,
                userAgentPackageName: 'com.example.vietnam_chronogis',
              ),
              polygonsAsync.when(
                data: (polygons) {
                  return PolygonLayer(polygons: polygons)
                      .animate(key: ValueKey(selectedYear))
                      .fadeIn(duration: 300.ms);
                },
                loading: () =>
                    const Center(child: CircularProgressIndicator()),
                error: (e, s) =>
                    Center(child: Text('Error loading polygons: $e')),
              ),
            ],
          ),
          const Positioned(
            right: 24,
            top: 24,
            child: MapControlsWidget(),
          ),
          const Positioned(
            right: 24,
            bottom: 164,
            child: ProvinceInfoPopup(),
          ),
        ],
      ),
    );
  }
}