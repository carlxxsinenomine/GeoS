import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geos/features/weather/domain/entities/ten_day_weather_entity.dart';

abstract class TenDayWeatherRepository {
  Future<Either<DioException, TenDayWeatherEntity>> getLatestTenDayWeather();
  Future<Either<DioException, TenDayWeatherEntity>> getAllTenDayWeather();
}