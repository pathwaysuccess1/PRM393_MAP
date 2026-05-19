import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/timeline_era.dart';

part 'timeline_provider.g.dart';

@riverpod
class SelectedYear extends _$SelectedYear {
  @override
  int build() {
    return 2025;
  }

  void setYear(int year) {
    if (year >= 1975 && year <= 2025) {
      state = year;
    }
  }
}

@riverpod
class IsPlaying extends _$IsPlaying {
  Timer? _timer;

  @override
  bool build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return false;
  }

  void toggle() {
    state = !state;
    if (state) {
      _startPlayback();
    } else {
      _stopPlayback();
    }
  }

  void _startPlayback() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      final currentYear = ref.read(selectedYearProvider);
      if (currentYear >= 2025) {
        _stopPlayback();
        state = false;
      } else {
        ref.read(selectedYearProvider.notifier).setYear(currentYear + 1);
      }
    });
  }

  void _stopPlayback() {
    _timer?.cancel();
    _timer = null;
  }
}

@riverpod
VietnamEra currentEra(CurrentEraRef ref) {
  final year = ref.watch(selectedYearProvider);
  return VietnamEra.fromYear(year);
}

@riverpod
int currentProvinceCount(CurrentProvinceCountRef ref) {
  final year = ref.watch(selectedYearProvider);
  return getProvinceCountForYear(year);
}

int getProvinceCountForYear(int year) {
  if (year == 1975) return 66; // approx
  if (year >= 1976 && year < 1991) return 38; // After first consolidation
  
  if (year >= 1991 && year < 1997) {
    // Gradual splitting from 38 to 61
    int base = 38;
    int progress = year - 1991;
    return base + (progress * 3); // rough approximation for the UI
  }
  
  if (year >= 1997 && year < 2004) return 61;
  if (year >= 2004 && year < 2008) return 64; // Dak Nong, Hau Giang, Dien Bien, Dak Lak split
  if (year >= 2008 && year < 2025) return 63; // Ha Tay merged into Hanoi
  if (year == 2025) return 34; // Resolution 202
  
  return 34;
}
