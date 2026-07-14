import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/features/weather/data/repositories_impl/ihourly_weather.dart';
import 'package:geos/features/weather/domain/entities/hourly_weather_entity.dart';
import 'package:geos/features/weather/domain/repositories/hourly_weather_repository.dart';

/// Notifier Providers
final hourlyWeatherNotifierProvider =
    AsyncNotifierProvider<HourlyWeatherNotifier, HourlyWeatherEntity>(() {
      return HourlyWeatherNotifier();
    });

final hourlyHistoryDataProvider =
    AsyncNotifierProvider<HourlyHistoryData, List<HourlyWeatherEntity>>(() {
      return HourlyHistoryData();
    });

/// Class Notifier
class HourlyWeatherNotifier extends AsyncNotifier<HourlyWeatherEntity> {
  late HourlyWeatherRepository _hourlyWeatherRepository;

  @override
  FutureOr<HourlyWeatherEntity> build() async {
    _hourlyWeatherRepository = ref.read(hourlyWeatherProvider);

    final result = await _hourlyWeatherRepository.getLatestHourlyWeather();
    return result.fold((error) => throw error, (data) => data);
  }

  Future<void> refreshData() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _hourlyWeatherRepository.getLatestHourlyWeather();
      return result.fold((error) => throw error, (data) => data);
    });
  }
}

class HourlyHistoryData extends AsyncNotifier<List<HourlyWeatherEntity>> {
  late HourlyWeatherRepository _hourlyWeatherRepository;

  @override
  FutureOr<List<HourlyWeatherEntity>> build() async {
    _hourlyWeatherRepository = ref.read(hourlyWeatherProvider);

    final result = await _hourlyWeatherRepository.getAllHourlyWeather();
    return result.fold((error) => throw error, (data) => data);
  }

  Future<void> getHistory() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _hourlyWeatherRepository.getAllHourlyWeather();
      return result.fold((error) => throw error, (data) => data);
    });
  }
}
