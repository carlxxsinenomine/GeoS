// times: List[str] = Field()
// icons: List[int] = Field()
// temps: List[float] = Field()
// conditions: List[str] = Field()
// precipitations: List[int] = Field()
class HourlyWeather {
  final List<String> times;
  final List<int> icons;
  final List<double> temperatures;
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
    times: json['times'],
    icons: json['icons'],
    temperatures: json['temps'],
    conditions: json['conditions'],
    precipitations: json['precipitations'],
  );

  Map<String, dynamic> toJson() => {
    'times': times,
    'icons': icons,
    'temps': temperatures,
    'conditions': conditions,
    'precipitations': precipitations
  };
}
