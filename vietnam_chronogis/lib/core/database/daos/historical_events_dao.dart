import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/historical_events_table.dart';

part 'historical_events_dao.g.dart';

@DriftAccessor(tables: [HistoricalEvents])
class HistoricalEventsDao extends DatabaseAccessor<AppDatabase>
    with _$HistoricalEventsDaoMixin {
  HistoricalEventsDao(AppDatabase db) : super(db);

  Future<void> insertEvent(HistoricalEventsCompanion entry) async {
    await into(historicalEvents).insert(entry, mode: InsertMode.insertOrIgnore);
  }

  Future<List<HistoricalEvent>> getAllEvents() {
    return (select(historicalEvents)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.startYear, mode: OrderingMode.asc)]))
        .get();
  }

  Future<List<HistoricalEvent>> getEventsByType(String type) {
    return (select(historicalEvents)
          ..where((t) => t.eventType.equals(type))
          ..orderBy(
              [(t) => OrderingTerm(expression: t.startYear, mode: OrderingMode.asc)]))
        .get();
  }
}
