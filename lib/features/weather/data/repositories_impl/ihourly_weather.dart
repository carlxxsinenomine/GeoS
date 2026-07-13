import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/features/weather/data/services/hourly/geos_hourly_service.dart';
import 'package:geos/features/weather/data/services/services_provider.dart';
import 'package:geos/features/weather/domain/entities/hourly_weather_entity.dart';
import 'package:geos/features/weather/domain/repositories/hourly_weather_repository.dart';

final hourlyWeatherProvider = Provider<HourlyWeatherRepository>((ref) {
  final hourlyWeatherService = ref.watch(hourlyServiceProvider);
  return IHourlyWeather(hourlyWeatherService);
});

class IHourlyWeather implements HourlyWeatherRepository {
  final GeosHourlyService _geosService;
  IHourlyWeather(GeosHourlyService api) : _geosService = api;
  @override
  Future<Either<Exception, List<HourlyWeatherEntity>>> getAllHourlyWeather() async {
    try {
      final weatherData = await _geosService.getAllHourlyWeather();
      return Right(weatherData.map((data) => data.toEntity()).toList());
    } catch(e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, HourlyWeatherEntity>> getLatestHourlyWeather() async {
    try {
      final weatherData = await _geosService.getLatestHourlyWeather();
      return Right(weatherData.toEntity());
    } catch (e) {
      return Left(Exception(e));
    }
  }

}