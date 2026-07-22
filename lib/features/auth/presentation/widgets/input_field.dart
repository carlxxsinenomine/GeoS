import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  final String label;
  final Widget textField;

  const InputField({super.key, required this.label, required this.textField});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.manrope(fontWeight: FontWeight(800), fontSize: 14),),
        const SizedBox(height: 4,),
        textField
      ],
    );
  }
}
