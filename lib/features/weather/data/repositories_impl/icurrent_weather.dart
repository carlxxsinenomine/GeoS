import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/core/di/dio_provider.dart';
import 'package:geos/features/weather/data/services/current/geos_current_service.dart';
import 'package:geos/features/weather/data/services/services_provider.dart';
import 'package:geos/features/weather/domain/entities/current_weather_entity.dart';
import 'package:geos/features/weather/domain/repositories/current_weather_repository.dart';

final currentWeatherProvider = Provider<CurrentWeatherRepository>((ref) {
  final currentWeatherService = ref.watch(currentServiceProvider);
  return ICurrentWeather(currentWeatherService);
});


class ICurrentWeather implements CurrentWeatherRepository {
  final GeosCurrentService _geosService;
  ICurrentWeather(GeosCurrentService api) : _geosService = api;

  @override
  Future<Either<Exception, List<CurrentWeatherEntity>>> getAllCurrentWeather() async {
    try {
      final weatherData = await _geosService.getAllCurrentWeather();
      return Right(weatherData.map((data) => data.toEntity()).toList());
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, CurrentWeatherEntity>> getCurrentLatestWeather() async {
    try {
      final weatherData = await _geosService.getLatestCurrentWeather();
      return Right(weatherData.toEntity());
    } catch (e) {
      return Left(Exception(e));
    }
  }
}