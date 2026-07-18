import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geos/core/contants.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalContainer extends StatelessWidget {
  final String? day;
  final String? date;
  final int? cloud;
  final int? temp;
  final int? rainProb;

  const HorizontalContainer({
    super.key,
    this.day,
    this.date,
    this.cloud,
    this.temp,
    this.rainProb,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(25),
      ),
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  day!,
                  style: GoogleFonts.roboto(
                    fontSize: 17,
                    fontWeight: FontWeight(800),
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  date!,
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight(500),
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            "$wunderPath${cloud ?? 7}.svg",
            width: 50,
            height: 50,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          ),
          Text(
            "${temp ?? 26}°",
            style: GoogleFonts.roboto(
              fontSize: 32,
              fontWeight: FontWeight(700),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("${pathBase}drop-icon.svg"),
              const SizedBox(width: 4),
              Text(
                "${rainProb ?? 40}%",
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
