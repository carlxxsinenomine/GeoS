class TenDayWeatherEntity {
  final List<String> dayOfWeek;
  final List<double> tempMax;
  final List<double> tempMin;
  final List<int> todayIcons;
  final List<int> tonightIcons;
  final List<int> precipChanceToday;
  final List<int> precipChanceTonight;

  TenDayWeatherEntity({
    required this.dayOfWeek,
    required this.tempMax,
    required this.tempMin,
    required this.todayIcons,
    required this.tonightIcons,
    required this.precipChanceToday,
    required this.precipChanceTonight,
  });
}
