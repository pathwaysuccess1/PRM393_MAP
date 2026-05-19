import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/database/app_database.dart';
import '../../../data/repositories/administrative_unit_repository.dart';
import '../../../shared/providers/map_provider.dart';
import '../../../shared/providers/timeline_provider.dart';
import 'widgets/map_controls_widget.dart';
import 'widgets/province_info_popup.dart';
import 'widgets/timeline_panel.dart';

final mapPolygonsProvider = FutureProvider<List<Polygon>>((ref) async {
  final repo = ref.watch(administrativeUnitRepositoryProvider);
  final provinces = await repo.getAllProvinces();
  final showBorders = ref.watch(showBordersStateProvider);
  final selectedMa = ref.watch(selectedProvinceProvider);

  List<Polygon> polygons = [];

  for (final province in provinces) {
    final cached = await repo.db.geoJsonDao.getGeoJsonByMa(province.ma);
    if (cached != null) {
      final decoded = jsonDecode(cached.geoJsonData) as List<dynamic>;
      
      final isSelected = selectedMa == province.ma;
      final fillColor = _getColorForRegion(province.macroRegion).withOpacity(isSelected ? 0.6 : 0.35);
      final borderColor = isSelected ? Colors.white : Colors.white.withOpacity(0.4);
      final borderThickness = isSelected ? 2.0 : (showBorders ? 1.0 : 0.0);

      // Simple implementation assuming list of list of lat/lng pairs
      // Note: A real app might need more complex parsing for MultiPolygon vs Polygon
      try {
        List<LatLng> points = [];
        for (var pt in decoded) {
          if (pt is List && pt.length >= 2) {
            points.add(LatLng(pt[1] as double, pt[0] as double)); // GeoJSON is Long/Lat
          }
        }
        
        if (points.isNotEmpty) {
           polygons.add(Polygon(
             points: points,
             color: fillColor,
             borderColor: borderColor,
             borderStrokeWidth: borderThickness,
           ));
        }
      } catch (e) {
        // Fallback for complex MultiPolygon arrays
        // This is a simplified approach. In a real scenario, you would recursively parse coordinates.
      }
    }
  }

  return polygons;
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
        : 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}'; // Example satellite URL

    return Scaffold(
      body: Stack(
        children: [
          // Flutter Map
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: const LatLng(16.0, 106.0),
              initialZoom: 5.5,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all,
              ),
              onTap: (tapPosition, point) {
                // In a full implementation, you would do a point-in-polygon check here
                // to find which province was clicked, then call:
                // ref.read(selectedProvinceProvider.notifier).select(clickedMa);
                // For now, clear selection if clicking outside
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
                  // Re-animate when year changes
                  return PolygonLayer(
                    polygons: polygons,
                  ).animate(key: ValueKey(selectedYear)).fadeIn(duration: 300.ms);
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => Center(child: Text('Error loading polygons: $e')),
              ),
            ],
          ),

          // Map Controls (Right side)
          const Positioned(
            right: 24,
            top: 24,
            child: MapControlsWidget(),
          ),

          // Province Info Popup (Bottom Right, above timeline)
          const Positioned(
            right: 24,
            bottom: 164, // Above the timeline panel
            child: ProvinceInfoPopup(),
          ),

          // Timeline Panel (Bottom) is now managed by AppShell instead of here
        ],
      ),
    );
  }
}
