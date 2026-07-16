import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geos/core/contants.dart';
import 'package:google_fonts/google_fonts.dart';

class VerticalContainer extends StatelessWidget {
  final String? time;
  final int? cloud;
  final int? temp;
  final int? precipitation;

  const VerticalContainer({
    super.key,
    this.time,
    this.cloud,
    this.temp,
    this.precipitation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(25),
      ),
      height: double.infinity,
      width: 100,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            time ?? '6AM',
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight(700),
            ),
          ),
          SvgPicture.asset("$pathBase$cloud.svg"),
          Text(
            "${temp ?? 26}°",
            style: GoogleFonts.roboto(
              fontSize: 32,
              fontWeight: FontWeight(700),
            ),
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "${pathBase}drop-icon.svg",
              ),
              SizedBox(width: 4),
              Text(
                "$precipitation%",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight(500),
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
