import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/features/weather/data/repositories_impl/icurrent_weather.dart';
import 'package:geos/features/weather/domain/entities/current_weather_entity.dart';
import 'package:geos/features/weather/domain/repositories/current_weather_repository.dart';

/// Notifier Providers
final currentWeatherNotifierProvider =
    AsyncNotifierProvider<CurrentWeatherNotifier, CurrentWeatherEntity>(() {
      return CurrentWeatherNotifier();
    });

final currentDataHistoryProvider =
    AsyncNotifierProvider<CurrentHistoryData, List<CurrentWeatherEntity>>(() {
      return CurrentHistoryData();
    });

/// Class Notifiers
class CurrentWeatherNotifier extends AsyncNotifier<CurrentWeatherEntity> {
  late CurrentWeatherRepository _currentWeatherRepository;

  @override
  FutureOr<CurrentWeatherEntity> build() async {
    _currentWeatherRepository = ref.read(currentWeatherProvider);

    final result = await _currentWeatherRepository.getCurrentLatestWeather();
    return result.fold((error) => throw error, (data) => data);
  }

  Future<void> refreshData() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _currentWeatherRepository.getCurrentLatestWeather();
      return result.fold((error) => throw error, (data) => data);
    });
  }
}

class CurrentHistoryData extends AsyncNotifier<List<CurrentWeatherEntity>> {
  late CurrentWeatherRepository _currentWeatherRepository;

  @override
  FutureOr<List<CurrentWeatherEntity>> build() async {
    _currentWeatherRepository = ref.read(currentWeatherProvider);

    final result = await _currentWeatherRepository.getAllCurrentWeather();
    return result.fold((error) => throw error, (data) => data);
  }

  Future<void> getHistory() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _currentWeatherRepository.getAllCurrentWeather();
      return result.fold((error) => throw error, (data) => data);
    });
  }
}
