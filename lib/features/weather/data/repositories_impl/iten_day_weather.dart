import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/features/weather/data/services/services_provider.dart';
import 'package:geos/features/weather/data/services/ten_day/geos_ten_day_service.dart';
import 'package:geos/features/weather/domain/entities/ten_day_weather_entity.dart';
import 'package:geos/features/weather/domain/repositories/ten_day_weather_repository.dart';

final tenDayWeatherProvider = Provider<TenDayWeatherRepository>((ref) {
  final tenDayWeatherService = ref.watch(tenDayServiceProvider);
  return ITenDayWeather(tenDayWeatherService);
});

class ITenDayWeather implements TenDayWeatherRepository {
  final GeosTenDayService _geosService;

  ITenDayWeather(GeosTenDayService api) : _geosService = api;

  @override
  Future<Either<Exception, List<TenDayWeatherEntity>>>
  getAllTenDayWeather() async {
    try {
      final weatherData = await _geosService.getAllTenDayWeather();
      return Right(weatherData.map((data) => data.toEntity()).toList());
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, TenDayWeatherEntity>>
  getLatestTenDayWeather() async {
    try {
      final weatherData = await _geosService.getLatestTenDayWeather();
      return Right(weatherData.toEntity());
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
