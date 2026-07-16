import 'package:flutter/material.dart';
import 'package:geos/features/weather/presentation/widgets/home_screen/vertical_container.dart';
import 'package:google_fonts/google_fonts.dart';

class HourlyWidget extends StatelessWidget {
  final Widget? hourlyWeather;
  const HourlyWidget({super.key, this.hourlyWeather});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: double.infinity,
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: 25,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        // color: Colors.pink.shade300,
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue.withValues(alpha: 0.3),
            Colors.lightBlue.withValues(alpha: 0.8),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "HOURLY WEATHER",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(Icons.arrow_forward),
            ],
          ),
          const SizedBox(height: 15),
          Expanded(
            child: hourlyWeather!
          ),
        ],
      ),
    );
  }
}
