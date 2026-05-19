import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../../../shared/providers/explorer_provider.dart';

class CommunesListSection extends ConsumerWidget {
  final List<AdministrativeUnit> communes;

  const CommunesListSection({super.key, required this.communes});

  static const int _pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final page = ref.watch(communesPageProvider);
    final visibleCount = (page * _pageSize).clamp(0, communes.length);
    final visibleCommunes = communes.sublist(0, visibleCount);
    final hasMore = visibleCount < communes.length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Danh sách xã / phường',
                style: theme.textTheme.titleSmall,
              ),
              const Spacer(),
              Text(
                '${communes.length} đơn vị',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (communes.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  'Không có dữ liệu',
                  style: TextStyle(color: Color(0xFF9AA0B0)),
                ),
              ),
            )
          else ...[
            ...visibleCommunes.map((commune) => _CommuneRow(commune: commune)),
            if (hasMore) ...[
              const SizedBox(height: 8),
              Center(
                child: TextButton.icon(
                  onPressed: () {
                    ref.read(communesPageProvider.notifier).state = page + 1;
                  },
                  icon: const Icon(Icons.expand_more, size: 18),
                  label: Text(
                    'Xem thêm (${communes.length - visibleCount} còn lại)',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}

class _CommuneRow extends StatelessWidget {
  final AdministrativeUnit commune;

  const _CommuneRow({required this.commune});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: const Color(0xFF9AA0B0).withOpacity(0.5),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              commune.ten,
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
            ),
          ),
          Text(
            commune.type,
            style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
