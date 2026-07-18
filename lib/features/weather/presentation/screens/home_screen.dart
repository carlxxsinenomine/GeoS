import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/features/weather/presentation/view_models/current_weather_notifier.dart';
import 'package:geos/features/weather/presentation/view_models/hourly_weather_notifier.dart';
import 'package:geos/features/weather/presentation/view_models/ten_day_weather_notifier.dart';
import 'package:geos/features/weather/presentation/widgets/current_widget.dart';
import 'package:geos/features/weather/presentation/widgets/home_screen/horizontal_container.dart';
import 'package:geos/features/weather/presentation/widgets/home_screen/vertical_container.dart';
import 'package:geos/features/weather/presentation/widgets/hourly_widget.dart';
import 'package:geos/features/weather/presentation/widgets/ten_day_widget.dart';
import 'package:geos/shared/widgets/bottom_nav.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final currentProvider = ref.watch(currentWeatherNotifierProvider);
    final hourlyProvider = ref.watch(hourlyWeatherNotifierProvider);
    final tenDayProvider = ref.watch(tenDayWeatherNotifierProvider);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              left: 10,
              right: 10,
              top: 0,
              bottom: 0,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView(
                  padding: EdgeInsets.only(bottom: 90),
                  children: [
                    currentProvider.when(
                      data: (data) {
                        return CurrentWidget(
                          temperature: "${data.temperature}",
                          realFeel: "${data.realFeel}",
                          iconCode: data.icon,
                          weatherCondition: data.weatherConditions,
                        );
                      },
                      error: (err, stack) {
                        return Center(child: Text('$err'));
                      },
                      loading: () {
                        return const CircularProgressIndicator();
                      },
                    ),
                    const SizedBox(height: 10),
                    hourlyProvider.when(
                      data: (data) {
                        final times = data.times;
                        final icons = data.icons;
                        final conditions = data.conditions;
                        final temperatures = data.temperatures;
                        final precipitations = data.precipitations;

                        return HourlyWidget(
                          hourlyWeather: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: times.length,
                            itemBuilder: (context, index) {
                              return VerticalContainer(
                                time: times[index],
                                cloud: icons[index],
                                temp: temperatures[index],
                                precipitation: precipitations[index],
                              );
                            },
                          ),
                        );
                      },
                      error: (err, stack) {
                        return Center(child: Text('$err'));
                      },
                      loading: () {
                        return const CircularProgressIndicator();
                      },
                    ),
                    const SizedBox(height: 10),
                    tenDayProvider.when(
                      data: (data) {
                        final dayOfWeek = data.dayOfWeek;
                        final todayIcons = data.todayIcons;
                        final dates = data.dates;
                        final tempMax = data.tempMax;
                        final precipChanceToday = data.precipChanceToday;
                        final precipChanceTonight = data.precipChanceTonight;

                        return TenDayWidget(
                          weatherData: ListView.builder(
                            itemCount: dayOfWeek.length,
                            itemBuilder: (context, index) {
                              return HorizontalContainer(
                                day: dayOfWeek[index],
                                date: dates[index],
                                temp: tempMax[index],
                                cloud: todayIcons[index],
                                rainProb: precipChanceToday[index],
                              );
                            },
                          ),
                        );
                      },
                      error: (error, stack) => Center(child: Text("$error")),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ),

            /// Header
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.white70],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 35),
                          Text(
                            "Libon, Albay",
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.notifications, size: 30),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(bottom: 10, right: 0, left: 0, child: BottomNav()),
          ],
        ),
      ),
    );
  }
}
