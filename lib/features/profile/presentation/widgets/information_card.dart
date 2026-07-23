import 'package:flutter/material.dart';
import 'package:geos/core/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationCard extends StatelessWidget {
  final Map<String, dynamic>? information;
  final String? label;

  const InformationCard({super.key, this.information, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: BoxBorder.all(width: 1, color: Colors.grey)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label!,
            style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: const FontWeight(900),
              color: Themes.primary,
            ),
          ),
          Divider(color: Colors.grey[400]),
          const SizedBox(height: 14,),
          ...information!.entries.map(
            (items) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    items.key,
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      color: Colors.black54,
                      fontWeight: const FontWeight(600),
                    ),
                  ),
                  Text(
                    items.value,
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: const FontWeight(600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
