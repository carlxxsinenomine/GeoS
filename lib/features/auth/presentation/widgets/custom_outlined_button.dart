import 'package:flutter/material.dart';
import 'package:geos/core/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  const CustomOutlinedButton({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Themes.primary, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Themes.primary),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 16,
                color: Themes.primary,
                fontWeight: const FontWeight(700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
