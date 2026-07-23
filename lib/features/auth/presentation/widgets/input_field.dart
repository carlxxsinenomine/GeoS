import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextField? textField;
  final TextEditingController? controller;
  final InputDecoration? inputDecoration;
  final bool shouldObscure;
  final String? passwordBelowText;

  const InputField({
    super.key,
    required this.label,
    this.textField,
    this.hintText,
    this.inputDecoration,
    this.controller,
    this.shouldObscure = false,
    this.passwordBelowText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.manrope(fontWeight: FontWeight(800), fontSize: 14),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          obscureText: shouldObscure,
          decoration:
              inputDecoration ??
              InputDecoration(
                hintText: hintText,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
        ),
        if(passwordBelowText != null) Text(passwordBelowText!),

      ],
    );
  }
}
