class TenDayWeatherEntity {
  final List<String> dayOfWeek;
  final List<int> tempMax;
  final List<int> tempMin;
  final List<int> todayIcons;
  final List<int> tonightIcons;
  final List<int> precipChanceToday;
  final List<int> precipChanceTonight;
  final List<String> dates;

  TenDayWeatherEntity({
    required this.dayOfWeek,
    required this.tempMax,
    required this.tempMin,
    required this.todayIcons,
    required this.tonightIcons,
    required this.precipChanceToday,
    required this.precipChanceTonight,
    required this.dates,
  });
}
