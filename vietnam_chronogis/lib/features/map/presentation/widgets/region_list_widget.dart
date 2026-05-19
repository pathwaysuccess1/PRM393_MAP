import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/database/app_database.dart';
import '../../../../shared/providers/search_provider.dart';
import '../../../../shared/providers/map_provider.dart';

class RegionListWidget extends ConsumerWidget {
  const RegionListWidget({super.key});

  static const _regions = <String, String>{
    'red_river_delta': 'Đồng bằng sông Hồng',
    'northern_midlands': 'Trung du & miền núi phía Bắc',
    'central_coast': 'Duyên hải miền Trung',
    'central_highlands': 'Tây Nguyên',
    'southeast': 'Đông Nam Bộ',
    'mekong_delta': 'Đồng bằng sông Cửu Long',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selectedRegion = ref.watch(regionFilterProvider);
    final provincesAsync = ref.watch(regionProvincesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: DropdownButtonFormField<String?>(
            value: selectedRegion,
            decoration: InputDecoration(
              labelText: 'Lọc theo vùng',
              labelStyle: theme.textTheme.bodySmall,
              filled: true,
              fillColor: const Color(0xFF252830),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            dropdownColor: const Color(0xFF252830),
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
            isExpanded: true,
            items: [
              const DropdownMenuItem<String?>(
                value: null,
                child: Text('Tất cả vùng'),
              ),
              ..._regions.entries.map((e) => DropdownMenuItem<String?>(
                    value: e.key,
                    child: Text(e.value, overflow: TextOverflow.ellipsis),
                  )),
            ],
            onChanged: (value) {
              ref.read(regionFilterProvider.notifier).state = value;
            },
          ),
        ),
        const SizedBox(height: 4),
        Expanded(
          child: provincesAsync.when(
            loading: () => const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            error: (e, s) => Center(
              child: Text('Lỗi: $e', style: theme.textTheme.bodySmall),
            ),
            data: (provinces) {
              if (provinces.isEmpty) {
                return Center(
                  child: Text(
                    'Không có dữ liệu',
                    style: theme.textTheme.bodySmall,
                  ),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: provinces.length,
                itemBuilder: (context, index) {
                  return _ProvinceListItem(province: provinces[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ProvinceListItem extends ConsumerWidget {
  final AdministrativeUnit province;

  const _ProvinceListItem({required this.province});

  String? _classificationBadge(AdministrativeUnit unit) {
    if (unit.ma == 'ha_noi') return 'CAPITAL';
    if (unit.ma == 'tp_ho_chi_minh') return 'CURRENT';
    if (unit.nPredecessors > 1) return 'REFORMED';
    if (unit.nPredecessors == 1) return 'UNCHANGED';
    return null;
  }

  Color _badgeColor(String badge) {
    switch (badge) {
      case 'CAPITAL':
        return const Color(0xFFE24B4A);
      case 'CURRENT':
        return const Color(0xFF2D5A8E);
      case 'REFORMED':
        return const Color(0xFFBA7517);
      case 'UNCHANGED':
        return const Color(0xFF1D9E75);
      default:
        return const Color(0xFF9AA0B0);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final badge = _classificationBadge(province);
    final selectedMa = ref.watch(selectedProvinceProvider);
    final isSelected = selectedMa == province.ma;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      color: isSelected
          ? const Color(0xFF2D5A8E).withOpacity(0.15)
          : Colors.transparent,
      child: InkWell(
        onTap: () {
          ref.read(selectedProvinceProvider.notifier).select(province.ma);
          if (province.centroidLat != null && province.centroidLon != null) {
            ref.read(mapControllerStateProvider).move(
                  LatLng(province.centroidLat!, province.centroidLon!),
                  9,
                );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      province.ten,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 13,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      province.type,
                      style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                    ),
                  ],
                ),
              ),
              if (badge != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: _badgeColor(badge).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    badge,
                    style: TextStyle(
                      color: _badgeColor(badge),
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
