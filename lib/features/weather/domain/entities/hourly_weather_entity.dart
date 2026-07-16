class HourlyWeatherEntity {
  final List<String> times;
  final List<int> icons;
  final List<int> temperatures;
  final List<String> conditions;
  final List<int> precipitations;

  HourlyWeatherEntity({
    required this.times,
    required this.icons,
    required this.temperatures,
    required this.conditions,
    required this.precipitations,
  });
}
