import 'package:flutter/material.dart';


class ToolbarButton extends StatelessWidget {
  const ToolbarButton({
    required this.icon,
    required this.tooltip,
    required this.isActive,
    required this.onTap,
    this.activeColor,
  });

  final IconData icon;
  final String tooltip;
  final bool isActive;
  final Color? activeColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final iconColor =
    isActive ? activeColor : Colors.black54;

    return Tooltip(
      message: tooltip,
      preferBelow: false,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: isActive
                ? (activeColor ?? const Color(0xFF3B82F6)).withValues(alpha: 0.18)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
      ),
    );
  }
}