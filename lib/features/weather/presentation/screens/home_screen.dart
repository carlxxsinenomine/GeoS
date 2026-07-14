import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/features/weather/presentation/view_models/current_weather_notifier.dart';
import 'package:geos/features/weather/presentation/view_models/hourly_weather_notifier.dart';
import 'package:geos/features/weather/presentation/view_models/ten_day_weather_notifier.dart';
import 'package:geos/features/weather/presentation/widgets/current_widget.dart';
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
              bottom: 90,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView(
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
                    HourlyWidget(),
                    const SizedBox(height: 10),
                    TenDayWidget(),
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
            Positioned(bottom: 0, right: 0, left: 0, child: BottomNav()),
          ],
        ),
      ),
    );
  }
}
