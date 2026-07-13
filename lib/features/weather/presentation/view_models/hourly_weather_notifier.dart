import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/features/weather/domain/entities/hourly_weather_entity.dart';
import 'package:geos/features/weather/domain/repositories/hourly_weather_repository.dart';

class HourlyWeatherNotifier extends AsyncNotifier<HourlyWeatherEntity> {
  late HourlyWeatherRepository _hourlyWeatherRepository;

  @override
  FutureOr<HourlyWeatherEntity> build() async {
    throw UnimplementedError();
  }
}