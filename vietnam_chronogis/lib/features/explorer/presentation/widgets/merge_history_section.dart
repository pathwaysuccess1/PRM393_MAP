import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/database/app_database.dart';

class MergeHistorySection extends StatelessWidget {
  final AdministrativeUnit province;

  const MergeHistorySection({super.key, required this.province});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final predecessors = province.predecessorsList
        .where((p) => p.trim().isNotEmpty)
        .toList();
    final hasMerge = predecessors.isNotEmpty && province.nPredecessors > 0;

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
            'Lịch sử sáp nhập',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 12),
          if (!hasMerge)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF1D9E75).withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'KHÔNG THAY ĐỔI',
                style: TextStyle(
                  color: Color(0xFF1D9E75),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            )
          else ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFBA7517).withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'SÁP NHẬP từ ${province.nPredecessors} tỉnh',
                style: const TextStyle(
                  color: Color(0xFFBA7517),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: predecessors.map((pred) {
                return ActionChip(
                  label: Text(
                    pred,
                    style: const TextStyle(fontSize: 12),
                  ),
                  backgroundColor:
                      const Color(0xFF2D5A8E).withOpacity(0.15),
                  side: BorderSide(
                    color: const Color(0xFF2D5A8E).withOpacity(0.3),
                  ),
                  onPressed: () {},
                );
              }).toList(),
            ),
          ],
          if (province.decreeUrl.isNotEmpty) ...[
            const SizedBox(height: 12),
            InkWell(
              onTap: () async {
                final uri = Uri.tryParse(province.decreeUrl);
                if (uri != null && await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.open_in_new,
                    size: 14,
                    color: Color(0xFF378ADD),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      province.decree.isNotEmpty
                          ? province.decree
                          : 'Xem nghị định',
                      style: const TextStyle(
                        color: Color(0xFF378ADD),
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
