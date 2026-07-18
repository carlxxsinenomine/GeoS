import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TenDayWidget extends StatelessWidget {
  final Widget? weatherData;

  const TenDayWidget({super.key, this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      padding: const EdgeInsetsGeometry.only(
        right: 25, left: 25, top: 20,
      ),
      decoration: BoxDecoration(
        // color: Colors.pink.shade300,
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue.withValues(alpha: 0.8),
            Colors.lightBlue.withValues(alpha: 0.3),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "10-DAY WEATHER FORECAST",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Icon(Icons.arrow_forward),
            ],
          ),
          const SizedBox(height: 15),
          Flexible(child: weatherData!),
        ],
      ),
    );
  }
}
