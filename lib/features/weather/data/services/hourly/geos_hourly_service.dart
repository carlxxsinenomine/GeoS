import 'package:dio/dio.dart';
import 'package:geos/core/contants.dart';
import 'package:geos/features/weather/data/models/hourly_weather.dart';
import 'package:retrofit/retrofit.dart';

part 'geos_hourly_service.g.dart';

@RestApi(baseUrl: "$baseUrl/hourly_weather")
abstract class GeosHourlyService {
  factory GeosHourlyService(Dio dio, {String baseUrl}) = _GeosHourlyService;

  @GET("/get_latest")
  Future<HourlyWeather> getLatestHourlyWeather();

  @GET('/get_all')
  Future<List<HourlyWeather>> getAllHourlyWeather();
}