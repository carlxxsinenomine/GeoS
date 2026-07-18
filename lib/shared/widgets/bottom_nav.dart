import 'package:flutter/material.dart';
import 'package:geos/features/map/presentation/screens/map_screen.dart';
import 'package:geos/features/weather/presentation/screens/home_screen.dart';
import 'package:geos/shared/widgets/nav_button.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  final VoidCallback? onPress;
  final String? currentPath;
  const BottomNav({super.key, this.onPress, this.currentPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 10,
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavButton(
              isActive: currentPath == HomeScreen.path,
              text: 'Home',
              icon: Icons.home,
              onPress: () {
                GoRouter.of(context).go(HomeScreen.path);
              },
            ),
            NavButton(
              isActive: currentPath == MapScreen.path,
              text: 'Map',
              icon: Icons.map_rounded,
              onPress: () {
                GoRouter.of(context).go(MapScreen.path);
              },
            ),
            NavButton(isActive: false, text: 'Profile', icon: Icons.person),
          ],
        ),
      ),
    );
  }
}
