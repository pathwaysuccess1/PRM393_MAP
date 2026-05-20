import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/administrative_units_table.dart';

part 'administrative_unit_dao.g.dart';

@DriftAccessor(tables: [AdministrativeUnits])
class AdministrativeUnitDao extends DatabaseAccessor<AppDatabase> with _$AdministrativeUnitDaoMixin {
  AdministrativeUnitDao(super.db);

  Future<void> upsertUnit(AdministrativeUnit unit) async {
    await into(administrativeUnits).insertOnConflictUpdate(unit);
  }

  Future<void> insertMultiple(List<AdministrativeUnit> units) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(administrativeUnits, units);
    });
  }

  Future<List<AdministrativeUnit>> getAllProvinces() {
    return (select(administrativeUnits)..where((t) => t.kind.equals('province'))).get();
  }

  Future<List<AdministrativeUnit>> getCommunesByProvince(String parentMa) {
    return (select(administrativeUnits)
          ..where((t) => t.kind.equals('commune') & t.parentMa.equals(parentMa))
          ..orderBy([(t) => OrderingTerm(expression: t.ten, mode: OrderingMode.asc)]))
        .get();
  }

  Future<AdministrativeUnit?> getUnitByMa(String ma) {
    return (select(administrativeUnits)..where((t) => t.ma.equals(ma))).getSingleOrNull();
  }

  Future<List<AdministrativeUnit>> getProvincesByRegion(String region) {
    return (select(administrativeUnits)
          ..where((t) => t.kind.equals('province') & t.macroRegion.equals(region)))
        .get();
  }

  Future<List<AdministrativeUnit>> searchUnits(String query) {
    return (select(administrativeUnits)
          ..where((t) => t.ten.like('%$query%') | t.tenShort.like('%$query%'))
          ..where((t) => t.kind.isIn(['province', 'commune']))
          ..limit(10))
        .get();
  }
}
