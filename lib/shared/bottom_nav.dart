import 'package:flutter/material.dart';
import 'package:geos/components/nav_button.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavButton(isActive: true, text: 'Home', icon: Icons.home,),
          NavButton(isActive: false, text: 'Map', icon: Icons.map_rounded,),
          NavButton(isActive: false, text: 'Profile', icon: Icons.person,),
        ],
      ),
    );
  }
}
