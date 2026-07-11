import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio_exception.dart';
import 'package:geos/features/weather/data/services/hourly/geos_hourly_service.dart';
import 'package:geos/features/weather/domain/entities/hourly_weather_entity.dart';
import 'package:geos/features/weather/domain/repositories/hourly_weather_repository.dart';

class IHourlyWeather extends HourlyWeatherRepository {
  final GeosHourlyService _geosService;
  IHourlyWeather(GeosHourlyService api) : _geosService = api;
  @override
  Future<Either<DioException, List<HourlyWeatherEntity>>> getAllHourlyWeather() async {
    try {
      final weatherData = await _geosService.getAllHourlyWeather();
      return Right(weatherData.map((data) => data.toEntity()).toList());
    } catch(e) {
      return Left(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<Either<DioException, HourlyWeatherEntity>> getLatestHourlyWeather() async {
    try {
      final weatherData = await _geosService.getLatestHourlyWeather();
      return Right(weatherData.toEntity());
    } catch (e) {
      return Left(DioException(requestOptions: RequestOptions()));
    }
  }

}