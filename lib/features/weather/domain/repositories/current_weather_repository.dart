import 'package:dartz/dartz.dart';
import 'package:geos/features/weather/domain/entities/current_weather_entity.dart';

abstract class CurrentWeatherRepository {
  Future<Either<Exception, CurrentWeatherEntity>> getCurrentLatestWeather();
  Future<Either<Exception, List<CurrentWeatherEntity>>> getAllCurrentWeather();
}