import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geos/shared/bottom_nav.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pathBase = 'assets/images/weathericons/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 10,
                  vertical: 9,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 35),
                        Text(
                          "Libon, Albay",
                          style: TextStyle(
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
            Positioned(
              left: 10,
              right: 10,
              top: 90,
              bottom: 90,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 39),
                      decoration: BoxDecoration(
                        // color: Colors.pink.shade300,
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
                                "26°",
                                style: GoogleFonts.roboto(
                                  fontSize: 90,
                                  fontWeight: FontWeight.bold,
                                  height: 0,
                                  letterSpacing: -1.5,
                                ),
                              ),
                              Text(
                                "Real Feel 26°",
                                style: GoogleFonts.roboto(
                                  fontSize: 26,
                                  letterSpacing: -1.5,
                                ),
                              ),
                              Text(
                                "Cloudy",
                                style: GoogleFonts.roboto(
                                  fontSize: 26,
                                  letterSpacing: -1,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "${pathBase}7.svg",
                            height: 110,
                            width: 110,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
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
                          SizedBox(height: 15),
                          Expanded(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
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
                                        "6 AM",
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight(700),
                                        ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "${pathBase}drop-icon.svg",
                                          ),
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
                                ),
                                Container(
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
                                        "6 AM",
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight(700),
                                        ),
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "${pathBase}drop-icon.svg",
                                          ),
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
                                ),
                                Container(
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
                                        "6 AM",
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight(700),
                                        ),
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "${pathBase}drop-icon.svg",
                                          ),
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
                                ),
                                Container(
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
                                        "6 AM",
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight(700),
                                        ),
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "${pathBase}drop-icon.svg",
                                          ),
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
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
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                          SizedBox(height: 15),
                          Expanded(
                            child: ListView(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  width: double.infinity,
                                  height: 100,
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                                color: Colors.black54
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "${pathBase}drop-icon.svg",
                                          ),
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
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  width: double.infinity,
                                  height: 100,
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              "THU",
                                              style: GoogleFonts.roboto(
                                                fontSize: 17,
                                                fontWeight: FontWeight(800),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              "7/2",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight(500),
                                                  color: Colors.black54
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "${pathBase}drop-icon.svg",
                                          ),
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
