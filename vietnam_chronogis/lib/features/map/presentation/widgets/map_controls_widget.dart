import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../../shared/providers/map_provider.dart';

class MapControlsWidget extends ConsumerWidget {
  const MapControlsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerStateProvider);
    final isSatellite = ref.watch(mapTileStyleStateProvider) == MapTileStyle.satellite;
    final showBorders = ref.watch(showBordersStateProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildButton(
          icon: Icons.add,
          tooltip: 'Zoom In',
          onPressed: () {
            final currentZoom = mapController.camera.zoom;
            mapController.move(mapController.camera.center, currentZoom + 1);
          },
        ),
        const SizedBox(height: 8),
        _buildButton(
          icon: Icons.remove,
          tooltip: 'Zoom Out',
          onPressed: () {
            final currentZoom = mapController.camera.zoom;
            mapController.move(mapController.camera.center, currentZoom - 1);
          },
        ),
        const SizedBox(height: 8),
        _buildButton(
          icon: Icons.crop_free,
          tooltip: 'Fit Vietnam',
          onPressed: () {
            mapController.move(const LatLng(16.0, 106.0), 5.5);
          },
        ),
        const SizedBox(height: 24),
        _buildButton(
          icon: isSatellite ? Icons.map : Icons.satellite,
          tooltip: 'Toggle Map Style',
          onPressed: () {
            ref.read(mapTileStyleStateProvider.notifier).toggle();
          },
        ),
        const SizedBox(height: 8),
        _buildButton(
          icon: showBorders ? Icons.grid_on : Icons.grid_off,
          tooltip: 'Toggle Borders',
          onPressed: () {
            ref.read(showBordersStateProvider.notifier).toggle();
          },
        ),
      ],
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D23).withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white70),
        tooltip: tooltip,
        onPressed: onPressed,
      ),
    );
  }
}
