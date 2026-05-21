import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/administrative_unit_repository.dart';
import 'geojson_provider.dart';

// FIX: StateProvider<double> đã bị xóa trong Riverpod 3.x
// Migration → Notifier<double> + NotifierProvider
class SeedProgressNotifier extends Notifier<double> {
  @override
  double build() => 0.0;

  void setProgress(double value) => state = value;
}

final seedProgressProvider = NotifierProvider<SeedProgressNotifier, double>(
  SeedProgressNotifier.new,
);

final seedInitializationProvider = FutureProvider<bool>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final hasSeeded = prefs.getBool('seeded_v1') ?? false;

  if (!hasSeeded) {
    final repository = ref.read(administrativeUnitRepositoryProvider);
    final geojsonService = ref.read(provinceGeoJsonServiceProvider);

    await for (final progress in repository.seedFromApi()) {
      // FIX: dùng .setProgress() thay vì .state = (state là @protected)
      ref.read(seedProgressProvider.notifier).setProgress(progress * 0.8);
    }

    ref.read(seedProgressProvider.notifier).setProgress(0.85);
    await geojsonService.loadAndMatchGeoJson();
    ref.read(seedProgressProvider.notifier).setProgress(1.0);

    await prefs.setBool('seeded_v1', true);
  }

  return true;
});
