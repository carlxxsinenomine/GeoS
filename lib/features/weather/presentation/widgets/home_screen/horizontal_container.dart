import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geos/core/contants.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalContainer extends StatelessWidget {
  final String? day;
  final String? date;
  final IconData? cloud;
  final String? temp;
  final String? rainProb;

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
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(25),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  "TODAY",
                  style: GoogleFonts.roboto(
                    fontSize: 17,
                    fontWeight: FontWeight(800),
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  "7/1",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight(500),
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          SvgPicture.asset("${pathBase}7.svg"),
          Text(
            "26°",
            style: GoogleFonts.roboto(
              fontSize: 32,
              fontWeight: FontWeight(700),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("${pathBase}drop-icon.svg"),
              SizedBox(width: 4),
              Text(
                "40%",
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
