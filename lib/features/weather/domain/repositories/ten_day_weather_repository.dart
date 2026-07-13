import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geos/features/weather/domain/entities/ten_day_weather_entity.dart';

abstract class TenDayWeatherRepository {
  Future<Either<Exception, TenDayWeatherEntity>> getLatestTenDayWeather();
  Future<Either<Exception, List<TenDayWeatherEntity>>> getAllTenDayWeather();
}