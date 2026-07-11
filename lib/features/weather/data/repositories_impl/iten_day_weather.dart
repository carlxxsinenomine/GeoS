import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio_exception.dart';
import 'package:flutter/services.dart';
import 'package:geos/features/weather/data/services/ten_day/geos_ten_day_service.dart';
import 'package:geos/features/weather/domain/entities/ten_day_weather_entity.dart';
import 'package:geos/features/weather/domain/repositories/ten_day_weather_repository.dart';

class ITenDayWeather extends TenDayWeatherRepository {
  final GeosTenDayService _geosService;
  ITenDayWeather(GeosTenDayService api) : _geosService = api;

  @override
  Future<Either<DioException, List<TenDayWeatherEntity>>> getAllTenDayWeather() async {
    try {
      final  weatherData = await _geosService.getAllTenDayWeather();
      return Right(weatherData.map((data) => data.toEntity()).toList());
    } catch (e) {
      return Left(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<Either<DioException, TenDayWeatherEntity>> getLatestTenDayWeather() async {
    try {
      final weatherData = await _geosService.getLatestTenDayWeather();
      return Right(weatherData.toEntity());
    } catch (e) {
      return Left(DioException(requestOptions: RequestOptions()));
    }
  }

}