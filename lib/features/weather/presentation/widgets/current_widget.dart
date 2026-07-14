import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geos/core/contants.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentWidget extends StatelessWidget {
  final String? temperature;
  final String? realFeel;
  final String? weatherCondition;
  final int? iconCode;

  const CurrentWidget({
    super.key,
    this.temperature,
    this.realFeel,
    this.iconCode,
    this.weatherCondition,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: EdgeInsetsGeometry.symmetric(horizontal: 39),
      margin: EdgeInsets.only(top: 90),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue.withValues(alpha: 0.7),
            Colors.lightBlue.withValues(alpha: 0.3),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${temperature ?? 26}°",
                style: GoogleFonts.roboto(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  height: 0,
                  letterSpacing: -1.5,
                ),
              ),
              Text(
                "Real Feel ${realFeel ?? 26}°",
                style: GoogleFonts.roboto(fontSize: 26, letterSpacing: -1.5),
              ),
              Text(
                weatherCondition ?? "Cloudy",
                style: GoogleFonts.roboto(
                  fontSize: 26,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            "$wunderPath${iconCode ?? 11}.svg",
            height: 110,
            width: 110,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          ),
        ],
      ),
    );
  }
}
