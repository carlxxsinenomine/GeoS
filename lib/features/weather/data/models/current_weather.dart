class CurrentWeather {
  final int icon;
  final double realFeel;
  final double temperature;
  final String weatherConditions;

  CurrentWeather({
    required this.icon,
    required this.realFeel,
    required this.temperature,
    required this.weatherConditions,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
    icon: json['icon'],
    realFeel: json['real_feel'],
    temperature: json['temp'],
    weatherConditions: json['weather_conditions'],
  );

  Map<String, dynamic> toJson() => {
    'icon': icon,
    'real_feel': realFeel,
    'temp': temperature,
    'weather_conditions': weatherConditions
  };


}
