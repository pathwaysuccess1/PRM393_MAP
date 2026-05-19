import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../shared/providers/explorer_provider.dart';
import 'widgets/province_hero_header.dart';
import 'widgets/stats_row.dart';
import 'widgets/merge_history_section.dart';
import 'widgets/communes_list_section.dart';

class ExplorerScreen extends ConsumerWidget {
  const ExplorerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(selectedProvinceDetailProvider);

    return detailAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(child: Text('Lỗi: $e')),
      data: (detail) {
        if (detail == null) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.touch_app,
                  size: 64,
                  color: const Color(0xFF9AA0B0).withOpacity(0.4),
                ),
                const SizedBox(height: 16),
                Text(
                  'Chọn một tỉnh trên bản đồ',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF9AA0B0),
                      ),
                ),
              ],
            ),
          );
        }

        final province = detail.province;
        final communes = detail.communes;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProvinceHeroHeader(province: province),
              const SizedBox(height: 16),
              StatsRow(province: province),
              const SizedBox(height: 16),
              MergeHistorySection(province: province),
              const SizedBox(height: 16),
              _AdministrativeInfoSection(province: province),
              const SizedBox(height: 16),
              CommunesListSection(communes: communes),
            ],
          ),
        );
      },
    );
  }
}

class _AdministrativeInfoSection extends StatelessWidget {
  final AdministrativeUnit province;

  const _AdministrativeInfoSection({required this.province});

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin hành chính',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 12),
          _InfoRow(
            label: 'Thủ phủ',
            value: province.capital ?? '—',
          ),
          _InfoRow(
            label: 'Địa chỉ',
            value: province.address ?? '—',
          ),
          _InfoRow(
            label: 'Vùng',
            value: _regionLabel(province.macroRegion),
          ),
          _InfoRow(
            label: 'Mã',
            value: province.ma,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: theme.textTheme.bodySmall,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
