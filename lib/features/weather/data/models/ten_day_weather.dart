// day_of_week: List[str] = Field()
// temp_max: List[float] = Field()
// temp_min: List[float] = Field()
// today_icon: List[int] = Field()
// tonight_icon: List[int] = Field()
// precip_chance_today: List[int] = Field()
// precip_chance_tonight: List[int] = Field()

import 'package:geos/features/weather/domain/entities/current_weather_entity.dart';
import 'package:geos/features/weather/domain/entities/ten_day_weather_entity.dart';

class TenDayWeather {
  final List<String> dayOfWeek;
  final List<int> tempMax;
  final List<int> tempMin;
  final List<int> todayIcons;
  final List<int> tonightIcons;
  final List<int> precipChanceToday;
  final List<int> precipChanceTonight;
  final List<String> dates;

  TenDayWeather({
    required this.dayOfWeek,
    required this.tempMax,
    required this.tempMin,
    required this.todayIcons,
    required this.tonightIcons,
    required this.precipChanceToday,
    required this.precipChanceTonight,
    required this.dates,
  });

  factory TenDayWeather.fromJson(Map<String, dynamic> json) => TenDayWeather(
    dayOfWeek: List<String>.from(json['day_of_week']),
    tempMax: List<int>.from(json['temp_max']),
    tempMin: List<int>.from(json['temp_min']),
    dates: List<String>.from(json['date']),
    todayIcons: List<int>.from(json['today_icon']),
    tonightIcons: List<int>.from(json['tonight_icon']),
    precipChanceToday: List<int>.from(json['precip_chance_today']),
    precipChanceTonight: List<int>.from(json['precip_chance_tonight']),
  );

  Map<String, dynamic> toJson() => {
    'day_of_week': dayOfWeek,
    'temp_max': tempMax,
    'temp_min': tempMin,
    'today_icon': todayIcons,
    'tonight_icon': tonightIcons,
    'precip_chance_today': precipChanceToday,
    'precip_chance_tonight': precipChanceTonight,
  };

  TenDayWeatherEntity toEntity() => TenDayWeatherEntity(
    dayOfWeek: dayOfWeek,
    tempMax: tempMax,
    tempMin: tempMin,
    dates: dates,
    todayIcons: todayIcons,
    tonightIcons: tonightIcons,
    precipChanceToday: precipChanceToday,
    precipChanceTonight: precipChanceTonight,
  );
}
