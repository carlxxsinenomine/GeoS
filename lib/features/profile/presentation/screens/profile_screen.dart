import 'package:flutter/material.dart';
import 'package:geos/core/theme/theme.dart';
import 'package:geos/features/profile/presentation/widgets/information_card.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  static const String path = "/profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  "Carl Johannes Munoz",
                  style: GoogleFonts.manrope(
                    fontWeight: const FontWeight(900),
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 24),
                InformationCard(
                  label: "PERSONAL INFORMATION",
                  information: <String, dynamic>{
                    'First Name': 'Carl Johannes',
                    'Middle Name': 'Llarenas',
                    'Last Name': 'Munoz',
                    'Suffix': 'N / a',
                    'Nationality': 'Filipino',
                  },
                ),
                const SizedBox(height: 24),
                InformationCard(
                  label: "CONTACT DETAILS",
                  information: <String, dynamic>{
                    'Phone': '+63991234456',
                    'Email': 'example@gmail.com',
                  },
                ),
                const SizedBox(height: 24),
                InformationCard(
                  label: "ADDRESS DETAILS",
                  information: <String, dynamic>{
                    'Province': 'Metro Manila',
                    'Municipality/City': 'Makati City',
                    'Barangay': 'Poblacion',
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Themes.primary,
                    ),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
