import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geos/features/weather/presentation/widgets/home_screen/horizontal_container.dart';
import 'package:geos/features/weather/presentation/widgets/home_screen/vertical_container.dart';
import 'package:geos/shared/widgets/bottom_nav.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/contants.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                    Container(
                      height: 250,
                      width: double.infinity,
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 39),
                      margin: EdgeInsets.only(top: 90),
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
                            "${wunderPath}11.svg",
                            height: 110,
                            width: 110,
                            color: Colors.white,
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
                          const SizedBox(height: 15),
                          Expanded(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                VerticalContainer(),
                                VerticalContainer(),
                                VerticalContainer(),
                                VerticalContainer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 400,
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
                          const SizedBox(height: 15),
                          Expanded(
                            child: ListView(
                              children: [
                                HorizontalContainer(),
                                HorizontalContainer(),
                                HorizontalContainer(),
                                HorizontalContainer(),
                                HorizontalContainer(),
                                HorizontalContainer(),
                                HorizontalContainer(),
                                HorizontalContainer(),
                                HorizontalContainer(),
                                HorizontalContainer(),
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
                              fontWeight: FontWeight.bold
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
