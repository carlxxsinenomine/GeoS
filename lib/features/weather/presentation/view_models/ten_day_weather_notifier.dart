import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/features/weather/data/repositories_impl/iten_day_weather.dart';
import 'package:geos/features/weather/domain/entities/ten_day_weather_entity.dart';
import 'package:geos/features/weather/domain/repositories/ten_day_weather_repository.dart';

/// Nofitifer Providers
final tenDayWeatherNotifierProvider =
    AsyncNotifierProvider<TenDayWeatherNotifier, TenDayWeatherEntity>(() {
      return TenDayWeatherNotifier();
    });

final tenDayHistoryData =
    AsyncNotifierProvider<TenDayHistoryData, List<TenDayWeatherEntity>>(() {
      return TenDayHistoryData();
    });

/// Class Notifiers
class TenDayWeatherNotifier extends AsyncNotifier<TenDayWeatherEntity> {
  late TenDayWeatherRepository _tenDayWeatherRepository;

  @override
  FutureOr<TenDayWeatherEntity> build() async {
    _tenDayWeatherRepository = ref.read(tenDayWeatherProvider);

    /// Load initial data
    /// I will change this later to load from local storage if there's no
    /// internet instead of always loading from the remote.
    final result = await _tenDayWeatherRepository.getLatestTenDayWeather();
    return result.fold((error) => throw error, (data) => data);
  }

  Future<void> refreshData() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final result = await _tenDayWeatherRepository.getLatestTenDayWeather();
      return result.fold((error) => throw error, (data) => data);
    });
  }
}

class TenDayHistoryData extends AsyncNotifier<List<TenDayWeatherEntity>> {
  late TenDayWeatherRepository _tenDayWeatherRepository;

  @override
  FutureOr<List<TenDayWeatherEntity>> build() async {
    _tenDayWeatherRepository = ref.read(tenDayWeatherProvider);

    final result = await _tenDayWeatherRepository.getAllTenDayWeather();
    return result.fold((error) => throw error, (weather) => weather);
  }

  Future<void> getHistory() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _tenDayWeatherRepository.getAllTenDayWeather();
      return result.fold((error) => throw error, (weather) => weather);
    });
  }
}
