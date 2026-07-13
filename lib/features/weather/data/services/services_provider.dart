import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/core/di/dio_provider.dart';
import 'package:geos/features/weather/data/services/current/geos_current_service.dart';
import 'package:geos/features/weather/data/services/hourly/geos_hourly_service.dart';
import 'package:geos/features/weather/data/services/ten_day/geos_ten_day_service.dart';

final currentServiceProvider = Provider<GeosCurrentService>((ref) {
  final dio = ref.watch(dioProvider);
  return GeosCurrentService(dio);
});

final hourlyServiceProvider = Provider<GeosHourlyService>((ref) {
  final dio = ref.watch(dioProvider);
  return GeosHourlyService(dio);
});

final tenDayServiceProvider = Provider<GeosTenDayService>((ref) {
  final dio = ref.watch(dioProvider);
  return GeosTenDayService(dio);
});