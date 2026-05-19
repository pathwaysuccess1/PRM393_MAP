import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/administrative_unit_repository.dart';
import 'geojson_provider.dart';

final seedProgressProvider = StateProvider<double>((ref) => 0.0);

final seedInitializationProvider = FutureProvider<bool>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final hasSeeded = prefs.getBool('seeded_v1') ?? false;

  if (!hasSeeded) {
    final repository = ref.read(administrativeUnitRepositoryProvider);
    final geojsonService = ref.read(provinceGeoJsonServiceProvider);
    
    await for (final progress in repository.seedFromApi()) {
      // Reserve 0.0-0.8 for API seeding, and 0.8-1.0 for GeoJSON mapping
      ref.read(seedProgressProvider.notifier).state = progress * 0.8;
    }
    
    // Parse and match GeoJSON
    ref.read(seedProgressProvider.notifier).state = 0.85;
    await geojsonService.loadAndMatchGeoJson();
    ref.read(seedProgressProvider.notifier).state = 1.0;
    
    await prefs.setBool('seeded_v1', true);
  }
  
  return true;
});
