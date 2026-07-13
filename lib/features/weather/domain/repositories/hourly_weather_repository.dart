import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geos/features/weather/domain/entities/hourly_weather_entity.dart';

abstract class HourlyWeatherRepository {
  Future<Either<Exception, HourlyWeatherEntity>> getLatestHourlyWeather();
  Future<Either<Exception, List<HourlyWeatherEntity>>> getAllHourlyWeather();
}