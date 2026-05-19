import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/database/app_database.dart';
import 'database_provider.dart';
import 'map_provider.dart';

class ProvinceDetail {
  final AdministrativeUnit province;
  final List<AdministrativeUnit> communes;

  ProvinceDetail({required this.province, required this.communes});
}

final selectedProvinceDetailProvider =
    FutureProvider.autoDispose<ProvinceDetail?>((ref) async {
  final selectedMa = ref.watch(selectedProvinceProvider);
  if (selectedMa == null) return null;

  ref.read(communesPageProvider.notifier).state = 1;

  final dao = ref.watch(administrativeUnitDaoProvider);
  final province = await dao.getUnitByMa(selectedMa);
  if (province == null) return null;

  final communes = await dao.getCommunesByProvince(selectedMa);

  return ProvinceDetail(province: province, communes: communes);
});

final communesPageProvider = StateProvider<int>((ref) => 1);
