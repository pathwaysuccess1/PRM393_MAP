import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/archives_provider.dart';
import 'widgets/province_count_chart.dart';
import 'widgets/event_card.dart';

class ArchivesScreen extends ConsumerWidget {
  const ArchivesScreen({super.key});

  static const _filterOptions = <String, String?>{
    'TẤT CẢ': null,
    'SÁP NHẬP': 'MERGE',
    'TÁCH TỈNH': 'SPLIT',
    'CẢI CÁCH': 'REFORM',
    'CHÍNH SÁCH': 'POLICY',
    'THỐNG NHẤT': 'UNIFICATION',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(archivesFilterProvider);
    final eventsAsync = ref.watch(filteredEventsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Lịch sử hành chính',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          const ProvinceCountChart(),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _filterOptions.entries.map((entry) {
                final isSelected = currentFilter == entry.value;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(
                      entry.key,
                      style: TextStyle(
                        fontSize: 12,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF9AA0B0),
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (_) {
                      ref.read(archivesFilterProvider.notifier).state =
                          entry.value;
                    },
                    selectedColor: const Color(0xFF2D5A8E),
                    backgroundColor:
                        const Color(0xFF252830),
                    checkmarkColor: Colors.white,
                    side: BorderSide(
                      color: isSelected
                          ? const Color(0xFF2D5A8E)
                          : const Color(0xFF9AA0B0).withOpacity(0.3),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          eventsAsync.when(
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (e, s) => Center(child: Text('Lỗi: $e')),
            data: (events) {
              if (events.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(32),
                  child: Center(
                    child: Text(
                      'Không có sự kiện nào',
                      style: TextStyle(color: Color(0xFF9AA0B0)),
                    ),
                  ),
                );
              }
              return Column(
                children: events.map((e) => EventCard(event: e)).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
