import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geos/features/weather/domain/entities/current_weather_entity.dart';

abstract class CurrentWeatherRepository {
  Future<Either<DioException, CurrentWeatherEntity>> getCurrentLatestWeather();
  Future<Either<DioException, List<CurrentWeatherEntity>>> getAllCurrentWeather();
}