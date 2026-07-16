// times: List[str] = Field()
// icons: List[int] = Field()
// temps: List[float] = Field()
// conditions: List[str] = Field()
// precipitations: List[int] = Field()
import 'package:geos/features/weather/domain/entities/hourly_weather_entity.dart';

class HourlyWeather {
  final List<String> times;
  final List<int> icons;
  final List<int> temperatures;
  final List<String> conditions;
  final List<int> precipitations;

  HourlyWeather({
    required this.times,
    required this.icons,
    required this.temperatures,
    required this.conditions,
    required this.precipitations,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) => HourlyWeather(
    times: List<String>.from(json['times']),
    icons: List<int>.from(json['icons']),
    temperatures: List<int>.from(json['temps']),
    conditions: List<String>.from(json['conditions']),
    precipitations: List<int>.from(json['precipitations']),
  );

  Map<String, dynamic> toJson() => {
    'times': times,
    'icons': icons,
    'temps': temperatures,
    'conditions': conditions,
    'precipitations': precipitations,
  };

  HourlyWeatherEntity toEntity() => HourlyWeatherEntity(
    times: times,
    icons: icons,
    temperatures: temperatures,
    conditions: conditions,
    precipitations: precipitations,
  );
}
