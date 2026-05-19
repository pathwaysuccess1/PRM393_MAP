import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';

import 'tables/administrative_units_table.dart';
import 'tables/historical_events_table.dart';
import 'tables/geojson_cache_table.dart';
import 'tables/chat_history_table.dart';
import 'daos/administrative_unit_dao.dart';
import 'daos/geojson_dao.dart';
import 'daos/chat_dao.dart';
import 'daos/historical_events_dao.dart';

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
    HistoricalEventsDao,
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
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle database migrations here in the future
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'vietnam_chronogis', 'chronogis.sqlite'));
    
    // Ensure the parent directory exists
    if (!await file.parent.exists()) {
      await file.parent.create(recursive: true);
    }

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
