import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/database/app_database.dart';
import '../../core/database/daos/historical_events_dao.dart';
import '../../shared/providers/database_provider.dart';

final historicalEventsRepositoryProvider =
    Provider<HistoricalEventsRepository>((ref) {
  final dao = ref.watch(historicalEventsDaoProvider);
  return HistoricalEventsRepository(dao);
});

class HistoricalEventsRepository {
  final HistoricalEventsDao _dao;

  HistoricalEventsRepository(this._dao);

  Future<void> seedDefaultEvents() async {
    final existing = await _dao.getAllEvents();
    if (existing.isNotEmpty) return;

    final events = <HistoricalEventsCompanion>[
      HistoricalEventsCompanion.insert(
        title: 'Thống nhất đất nước',
        description:
            'Ngày 30/4/1975, Việt Nam thống nhất sau chiến tranh. '
            'Miền Nam và miền Bắc hợp nhất thành nước Cộng hòa Xã hội Chủ nghĩa Việt Nam '
            'với 66 đơn vị hành chính cấp tỉnh.',
        startYear: 1975,
        endYear: const Value(1975),
        eventType: 'UNIFICATION',
        relatedProvinceMas: '',
      ),
      HistoricalEventsCompanion.insert(
        title: 'Hợp nhất tỉnh lần 1',
        description:
            'Năm 1976, Quốc hội quyết định sáp nhập hàng loạt tỉnh thành, '
            'giảm từ 66 xuống còn 38 đơn vị hành chính cấp tỉnh/thành phố trực thuộc TW.',
        startYear: 1976,
        endYear: const Value(1976),
        eventType: 'MERGE',
        relatedProvinceMas: '',
      ),
      HistoricalEventsCompanion.insert(
        title: 'Tách tỉnh giai đoạn 1991–1997',
        description:
            'Từ 1991 đến 1997, nhiều tỉnh được tách ra trở lại để phù hợp với '
            'yêu cầu quản lý hành chính. Số tỉnh tăng dần từ 38 lên 61.',
        startYear: 1991,
        endYear: const Value(1997),
        eventType: 'SPLIT',
        relatedProvinceMas: '',
      ),
      HistoricalEventsCompanion.insert(
        title: 'Ổn định 61 tỉnh thành',
        description:
            'Giai đoạn 1997–2003, Việt Nam duy trì 61 đơn vị hành chính cấp tỉnh '
            'sau đợt tách tỉnh lớn.',
        startYear: 1997,
        endYear: const Value(2003),
        eventType: 'REFORM',
        relatedProvinceMas: '',
      ),
      HistoricalEventsCompanion.insert(
        title: 'Tách tỉnh 2004',
        description:
            'Năm 2004, các tỉnh Đắk Nông, Hậu Giang, Điện Biên được tách ra, '
            'nâng tổng số tỉnh thành lên 64.',
        startYear: 2004,
        endYear: const Value(2004),
        eventType: 'SPLIT',
        relatedProvinceMas: 'dak_nong||hau_giang||dien_bien',
      ),
      HistoricalEventsCompanion.insert(
        title: 'Sáp nhập Hà Tây vào Hà Nội',
        description:
            'Ngày 1/8/2008, toàn bộ tỉnh Hà Tây, huyện Mê Linh (Vĩnh Phúc) '
            'và 4 xã thuộc huyện Lương Sơn (Hoà Bình) sáp nhập vào Hà Nội. '
            'Tổng số giảm xuống 63.',
        startYear: 2008,
        endYear: const Value(2008),
        eventType: 'MERGE',
        relatedProvinceMas: 'ha_noi',
      ),
      HistoricalEventsCompanion.insert(
        title: 'Nghị quyết 35 – Chủ trương sắp xếp',
        description:
            'Năm 2024, Trung ương ban hành Nghị quyết 35 về chủ trương sắp xếp '
            'đơn vị hành chính cấp tỉnh giai đoạn 2025–2030, mở đường cho '
            'đợt hợp nhất lớn nhất lịch sử.',
        startYear: 2024,
        endYear: const Value(2024),
        eventType: 'POLICY',
        relatedProvinceMas: '',
      ),
      HistoricalEventsCompanion.insert(
        title: 'Nghị quyết 202 – Hợp nhất lớn 2025',
        description:
            'Quốc hội thông qua Nghị quyết 202/2025/QH15, sáp nhập hàng loạt tỉnh '
            'từ 63 xuống còn 34 đơn vị hành chính cấp tỉnh, '
            'có hiệu lực từ 1/7/2025.',
        startYear: 2025,
        endYear: const Value(2025),
        eventType: 'MERGE',
        relatedProvinceMas: '',
      ),
    ];

    for (final event in events) {
      await _dao.insertEvent(event);
    }
  }

  Future<List<HistoricalEvent>> getAllEvents() {
    return _dao.getAllEvents();
  }

  Future<List<HistoricalEvent>> getEventsByType(String type) {
    return _dao.getEventsByType(type);
  }
}
