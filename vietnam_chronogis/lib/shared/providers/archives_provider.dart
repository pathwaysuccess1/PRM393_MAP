import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/database/app_database.dart';
import '../../data/repositories/historical_events_repository.dart';

final archivesFilterProvider = StateProvider<String?>((ref) => null);

final allEventsProvider = FutureProvider<List<HistoricalEvent>>((ref) async {
  final repo = ref.watch(historicalEventsRepositoryProvider);
  await repo.seedDefaultEvents();
  return repo.getAllEvents();
});

final filteredEventsProvider = Provider<AsyncValue<List<HistoricalEvent>>>((ref) {
  final filter = ref.watch(archivesFilterProvider);
  final eventsAsync = ref.watch(allEventsProvider);

  return eventsAsync.whenData((events) {
    if (filter == null) return events;
    return events.where((e) => e.eventType == filter).toList();
  });
});
