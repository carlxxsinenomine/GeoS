import 'package:flutter/material.dart';
import 'package:geos/contants.dart';

class NavButton extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final String text;
  final VoidCallback? onPress;

  const NavButton({
    super.key,
    required this.isActive,
    required this.text,
    required this.icon,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: isActive ? kNavPanelBtn.withValues(alpha: 0.3) : null,
          borderRadius: BorderRadius.circular(23),
          border: isActive
              ? BoxBorder.fromLTRB(
                  bottom: BorderSide(color: kNavPanelBtn, width: 5),
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isActive ? kNavPanelBtn : Colors.black),
            Text(
              text,
              style: TextStyle(color: isActive ? kNavPanelBtn : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
