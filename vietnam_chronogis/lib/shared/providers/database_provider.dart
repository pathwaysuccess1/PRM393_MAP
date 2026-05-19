import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/database/app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final administrativeUnitDaoProvider = Provider((ref) {
  return ref.watch(databaseProvider).administrativeUnitDao;
});

final geoJsonDaoProvider = Provider((ref) {
  return ref.watch(databaseProvider).geoJsonDao;
});

final chatDaoProvider = Provider((ref) {
  return ref.watch(databaseProvider).chatDao;
});

final historicalEventsDaoProvider = Provider((ref) {
  return ref.watch(databaseProvider).historicalEventsDao;
});
