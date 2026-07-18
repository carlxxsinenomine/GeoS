import 'package:flutter/material.dart';
import 'package:geos/shared/widgets/nav_button.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
            NavButton(isActive: true, text: 'Home', icon: Icons.home,),
            NavButton(isActive: false, text: 'Map', icon: Icons.map_rounded,),
            NavButton(isActive: false, text: 'Profile', icon: Icons.person,),
          ],
        ),
      ),
    );
  }
}
