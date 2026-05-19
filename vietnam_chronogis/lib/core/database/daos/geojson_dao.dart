import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/geojson_cache_table.dart';

part 'geojson_dao.g.dart';

@DriftAccessor(tables: [GeoJsonCaches])
class GeoJsonDao extends DatabaseAccessor<AppDatabase> with _$GeoJsonDaoMixin {
  GeoJsonDao(AppDatabase db) : super(db);

  Future<void> cacheGeoJson(String ma, String data) async {
    await into(geoJsonCaches).insertOnConflictUpdate(
      GeoJsonCach(ma: ma, geoJsonData: data),
    );
  }

  Future<GeoJsonCach?> getGeoJsonByMa(String ma) {
    return (select(geoJsonCaches)..where((t) => t.ma.equals(ma))).getSingleOrNull();
  }
}
