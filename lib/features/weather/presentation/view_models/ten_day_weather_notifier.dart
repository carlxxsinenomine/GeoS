import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/features/weather/domain/entities/ten_day_weather_entity.dart';
import 'package:geos/features/weather/domain/repositories/ten_day_weather_repository.dart';

class TenDayWeatherNotifier extends AsyncNotifier<TenDayWeatherEntity> {
  late TenDayWeatherRepository _tenDayWeatherRepository;

  @override
  FutureOr<TenDayWeatherEntity> build() async {
    throw UnimplementedError();
  }
}