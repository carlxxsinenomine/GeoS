import 'package:dio/dio.dart';
import 'package:geos/core/contants.dart';
import 'package:geos/features/weather/data/models/ten_day_weather.dart';
import 'package:retrofit/retrofit.dart';

part 'geos_ten_day_service.g.dart';

@RestApi(baseUrl: "$baseUrl/ten_day_weather")
abstract class GeosTenDayService {
  factory GeosTenDayService(Dio dio, {String baseUrl}) = _GeosTenDayService;

  @GET('/get_latest')
  Future<TenDayWeather> getLatestTenDayWeather();

  @GET('/get_all')
  Future<List<TenDayWeather>> getAllTenDayWeather();
}