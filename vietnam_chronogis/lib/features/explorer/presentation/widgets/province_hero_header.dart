import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/database/app_database.dart';

class ProvinceHeroHeader extends StatelessWidget {
  final AdministrativeUnit province;

  const ProvinceHeroHeader({super.key, required this.province});

  String _typeLabel(String type) {
    switch (type.toLowerCase()) {
      case 'thành phố trung ương':
        return 'Thành phố';
      case 'tỉnh':
        return 'Tỉnh';
      case 'thủ đô':
        return 'Thủ đô';
      default:
        return type;
    }
  }

  String _regionLabel(String region) {
    switch (region) {
      case 'red_river_delta':
        return 'Đồng bằng sông Hồng';
      case 'northern_midlands':
        return 'Trung du & miền núi phía Bắc';
      case 'central_coast':
        return 'Duyên hải miền Trung';
      case 'central_highlands':
        return 'Tây Nguyên';
      case 'southeast':
        return 'Đông Nam Bộ';
      case 'mekong_delta':
        return 'Đồng bằng sông Cửu Long';
      default:
        return region;
    }
  }

  Color _regionColor(String region) {
    switch (region) {
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final regionColor = _regionColor(province.macroRegion);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            province.ten,
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _Badge(
                label: _typeLabel(province.type),
                color: const Color(0xFF2D5A8E),
              ),
              _Badge(
                label: _regionLabel(province.macroRegion),
                color: regionColor,
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (province.centroidLat != null && province.centroidLon != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 150,
                child: AbsorbPointer(
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(
                        province.centroidLat!,
                        province.centroidLon!,
                      ),
                      initialZoom: 8,
                      interactionOptions: const InteractionOptions(
                        flags: InteractiveFlag.none,
                      ),
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.vietnam_chronogis',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(
                              province.centroidLat!,
                              province.centroidLon!,
                            ),
                            width: 24,
                            height: 24,
                            child: Container(
                              decoration: BoxDecoration(
                                color: regionColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;

  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
