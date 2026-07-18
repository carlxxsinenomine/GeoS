import 'package:flutter/material.dart';

class ToolbarDivider extends StatelessWidget {
  const ToolbarDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.white12,
    );
  }
}