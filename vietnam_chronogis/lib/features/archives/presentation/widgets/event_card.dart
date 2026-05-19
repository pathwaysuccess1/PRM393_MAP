import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../../../shared/providers/timeline_provider.dart';
import '../../../shell/presentation/app_shell.dart';

class EventCard extends ConsumerStatefulWidget {
  final HistoricalEvent event;

  const EventCard({super.key, required this.event});

  @override
  ConsumerState<EventCard> createState() => _EventCardState();
}

class _EventCardState extends ConsumerState<EventCard> {
  bool _expanded = false;

  Color _typeColor(String type) {
    switch (type) {
      case 'MERGE':
        return const Color(0xFFBA7517);
      case 'SPLIT':
        return const Color(0xFF1D9E75);
      case 'REFORM':
        return const Color(0xFF2D5A8E);
      case 'POLICY':
        return const Color(0xFF534AB7);
      case 'UNIFICATION':
        return const Color(0xFFE24B4A);
      default:
        return const Color(0xFF9AA0B0);
    }
  }

  String _typeLabel(String type) {
    switch (type) {
      case 'MERGE':
        return 'SÁP NHẬP';
      case 'SPLIT':
        return 'TÁCH TỈNH';
      case 'REFORM':
        return 'CẢI CÁCH';
      case 'POLICY':
        return 'CHÍNH SÁCH';
      case 'UNIFICATION':
        return 'THỐNG NHẤT';
      default:
        return type;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final event = widget.event;
    final typeColor = _typeColor(event.eventType);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          left: BorderSide(color: typeColor, width: 3),
        ),
      ),
      child: InkWell(
        onTap: () => setState(() => _expanded = !_expanded),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${event.startYear}',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: typeColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: typeColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            _typeLabel(event.eventType),
                            style: TextStyle(
                              color: typeColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          event.title,
                          style: theme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: const Color(0xFF9AA0B0),
                    size: 20,
                  ),
                ],
              ),
              if (_expanded) ...[
                const SizedBox(height: 12),
                Text(
                  event.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {
                    ref
                        .read(selectedYearProvider.notifier)
                        .setYear(event.startYear);
                    ref.read(selectedTabProvider.notifier).state = 0;
                  },
                  icon: const Icon(Icons.map, size: 16),
                  label: const Text(
                    'Xem trên bản đồ',
                    style: TextStyle(fontSize: 12),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: typeColor,
                    side: BorderSide(color: typeColor.withOpacity(0.4)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
