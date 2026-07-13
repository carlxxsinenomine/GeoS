import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/features/weather/domain/entities/current_weather_entity.dart';
import 'package:geos/features/weather/domain/repositories/current_weather_repository.dart';

class CurrentWeatherNotifier extends AsyncNotifier<CurrentWeatherEntity> {
  late CurrentWeatherRepository _currentWeatherRepository;

  @override
  FutureOr<CurrentWeatherEntity> build() {
    throw UnimplementedError();
  }
}