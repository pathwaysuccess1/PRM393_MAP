import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/database/app_database.dart';
import '../../../../shared/providers/search_provider.dart';
import '../../../../shared/providers/map_provider.dart';

class SearchResultsList extends ConsumerStatefulWidget {
  const SearchResultsList({super.key});

  @override
  ConsumerState<SearchResultsList> createState() => _SearchResultsListState();
}

class _SearchResultsListState extends ConsumerState<SearchResultsList> {
  int _highlightedIndex = -1;

  void _selectResult(AdministrativeUnit unit) {
    final ma = unit.kind == 'commune' ? (unit.parentMa ?? unit.ma) : unit.ma;
    ref.read(selectedProvinceProvider.notifier).select(ma);

    if (unit.centroidLat != null && unit.centroidLon != null) {
      final controller = ref.read(mapControllerStateProvider);
      controller.move(
        LatLng(unit.centroidLat!, unit.centroidLon!),
        9,
      );
    }

    ref.read(searchQueryProvider.notifier).state = '';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final query = ref.watch(searchQueryProvider);
    final resultsAsync = ref.watch(searchResultsProvider);

    if (query.trim().isEmpty) return const SizedBox.shrink();

    return resultsAsync.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        )),
      ),
      error: (e, s) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Lỗi: $e', style: theme.textTheme.bodySmall),
      ),
      data: (results) {
        if (results.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Không tìm thấy kết quả',
                style: theme.textTheme.bodySmall,
              ),
            ),
          );
        }

        return KeyboardListener(
          focusNode: FocusNode(),
          onKeyEvent: (event) {
            if (event is KeyDownEvent) {
              if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                setState(() {
                  _highlightedIndex =
                      (_highlightedIndex + 1).clamp(0, results.length - 1);
                });
              } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                setState(() {
                  _highlightedIndex =
                      (_highlightedIndex - 1).clamp(0, results.length - 1);
                });
              } else if (event.logicalKey == LogicalKeyboardKey.enter &&
                  _highlightedIndex >= 0) {
                _selectResult(results[_highlightedIndex]);
              } else if (event.logicalKey == LogicalKeyboardKey.escape) {
                ref.read(searchQueryProvider.notifier).state = '';
              }
            }
          },
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: results.length,
            itemBuilder: (context, index) {
              final unit = results[index];
              final isHighlighted = index == _highlightedIndex;

              return _SearchResultItem(
                unit: unit,
                isHighlighted: isHighlighted,
                onTap: () => _selectResult(unit),
                onHover: (hovering) {
                  if (hovering) setState(() => _highlightedIndex = index);
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  final AdministrativeUnit unit;
  final bool isHighlighted;
  final VoidCallback onTap;
  final ValueChanged<bool> onHover;

  const _SearchResultItem({
    required this.unit,
    required this.isHighlighted,
    required this.onTap,
    required this.onHover,
  });

  String _typeBadge(String kind) {
    switch (kind) {
      case 'province':
        return 'Tỉnh/Thành';
      case 'commune':
        return 'Xã/Thị trấn';
      default:
        return kind;
    }
  }

  Color _typeColor(String kind) {
    switch (kind) {
      case 'province':
        return const Color(0xFF2D5A8E);
      case 'commune':
        return const Color(0xFF1D9E75);
      default:
        return const Color(0xFF9AA0B0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final badgeColor = _typeColor(unit.kind);

    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isHighlighted
            ? const Color(0xFF2D5A8E).withOpacity(0.15)
            : Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        unit.ten,
                        style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (unit.parentTen != null)
                        Text(
                          unit.parentTen!,
                          style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: badgeColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _typeBadge(unit.kind),
                    style: TextStyle(
                      color: badgeColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
