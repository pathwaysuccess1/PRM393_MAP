import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

import 'tables/administrative_units_table.dart';
import 'tables/historical_events_table.dart';
import 'tables/geojson_cache_table.dart';
import 'tables/chat_history_table.dart';
import 'daos/administrative_unit_dao.dart';
import 'daos/geojson_dao.dart';
import 'daos/chat_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    AdministrativeUnits,
    HistoricalEvents,
    GeoJsonCaches,
    ChatHistoryMessages,
  ],
  daos: [
    AdministrativeUnitDao,
    GeoJsonDao,
    ChatDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(
        p.join(dbFolder.path, 'vietnam_chronogis', 'chronogis.sqlite'));

    if (!await file.parent.exists()) {
      await file.parent.create(recursive: true);
    }

    // FIX: applyWorkaroundToOpenSqlite3OnOldAndroidVersions() đã bị xóa
    // khỏi sqlite3_flutter_libs v0.6.0 — import cũng xóa theo
    // (sqlite3_flutter_libs giờ tự handle workaround internally)

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}