import 'package:dio/dio.dart';
import 'package:geos/core/contants.dart';
import 'package:geos/features/weather/data/models/current_weather.dart';
import 'package:retrofit/retrofit.dart';

part 'geos_current_service.g.dart';

@RestApi(baseUrl: "$baseUrl/current_weather")
abstract class GeosCurrentService {
  factory GeosCurrentService(Dio dio, {String baseUrl}) = _GeosCurrentService;
  @GET('/get_latest')
  Future<CurrentWeather> getLatestCurrentWeather();

  @GET('/get_all')
  Future<List<CurrentWeather>> getAllCurrentWeather();
}