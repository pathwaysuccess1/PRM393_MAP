import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/database/app_database.dart';
import 'database_provider.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider =
    FutureProvider.autoDispose<List<AdministrativeUnit>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.trim().isEmpty) return [];

  final dao = ref.watch(administrativeUnitDaoProvider);
  return dao.searchUnits(query.trim());
});

final regionFilterProvider = StateProvider<String?>((ref) => null);

final regionProvincesProvider =
    FutureProvider.autoDispose<List<AdministrativeUnit>>((ref) async {
  final region = ref.watch(regionFilterProvider);
  final dao = ref.watch(administrativeUnitDaoProvider);

  List<AdministrativeUnit> provinces;
  if (region != null) {
    provinces = await dao.getProvincesByRegion(region);
  } else {
    provinces = await dao.getAllProvinces();
  }

  provinces.sort((a, b) {
    final popA = a.population ?? 0;
    final popB = b.population ?? 0;
    return popB.compareTo(popA);
  });

  return provinces.take(20).toList();
});
