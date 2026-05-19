import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/database/app_database.dart';

class StatsRow extends StatelessWidget {
  final AdministrativeUnit province;

  const StatsRow({super.key, required this.province});

  @override
  Widget build(BuildContext context) {
    final numberFmt = NumberFormat('#,##0.#', 'vi_VN');
    final intFmt = NumberFormat('#,##0', 'vi_VN');

    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.square_foot,
            label: 'Diện tích',
            value: province.areaKm2 != null
                ? '${numberFmt.format(province.areaKm2)} km²'
                : '—',
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _StatCard(
            icon: Icons.people,
            label: 'Dân số',
            value: province.population != null
                ? intFmt.format(province.population)
                : '—',
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _StatCard(
            icon: Icons.density_small,
            label: 'Mật độ',
            value: province.density != null
                ? '${numberFmt.format(province.density)} /km²'
                : '—',
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: const Color(0xFF9AA0B0)),
          const SizedBox(height: 8),
          Text(
            label,
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleSmall?.copyWith(fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
