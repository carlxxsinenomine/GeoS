import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final int? maxLines;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;

  const CTextField({
    super.key,
    this.controller,
    this.label,
    this.decoration,
    this.keyboardType,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label!),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: decoration,
        ),
      ],
    );
  }
}
