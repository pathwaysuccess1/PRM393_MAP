import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../shared/providers/map_provider.dart';
import '../../../../data/repositories/administrative_unit_repository.dart';
import '../../../../core/database/app_database.dart';
import 'package:go_router/go_router.dart';

class ProvinceInfoPopup extends ConsumerWidget {
  const ProvinceInfoPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMa = ref.watch(selectedProvinceProvider);
    if (selectedMa == null) return const SizedBox.shrink();

    final repo = ref.watch(administrativeUnitRepositoryProvider);

    return FutureBuilder<AdministrativeUnit?>(
      future: repo.getUnitByMa(selectedMa),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();

        final unit = snapshot.data!;
        final popFormat = NumberFormat.compact(locale: 'vi_VN');
        final areaFormat = NumberFormat('#,##0.##', 'vi_VN');

        return Container(
          width: 300,
          margin: const EdgeInsets.only(bottom: 24, right: 24),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1D23).withValues(alpha: 0.95),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      unit.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white54, size: 20),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => ref.read(selectedProvinceProvider.notifier).clear(),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  unit.type.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildInfoRow(Icons.people, 'Population', 
                  unit.population != null ? popFormat.format(unit.population) : 'N/A'),
              const SizedBox(height: 8),
              _buildInfoRow(Icons.map, 'Area', 
                  unit.area != null ? '${areaFormat.format(unit.area)} km²' : 'N/A'),
              if (unit.nPredecessors != null && unit.nPredecessors! > 1) ...[
                const SizedBox(height: 8),
                _buildInfoRow(Icons.merge_type, 'History', 'Merged from ${unit.nPredecessors} provinces', color: Colors.amber),
              ],
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to explorer with selected province
                    context.go('/explorer');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Xem chi tiết'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, {Color? color}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color ?? Colors.white54),
        const SizedBox(width: 8),
        Text(
          '$label:',
          style: TextStyle(
            color: color ?? Colors.white54,
            fontSize: 13,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: TextStyle(
            color: color ?? Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
