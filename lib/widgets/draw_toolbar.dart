import 'package:flutter/material.dart';

import '../models/draw_mode.dart';

class DrawToolbar extends StatelessWidget {
  const DrawToolbar({
    super.key,
    required this.drawMode,
    required this.hasActivePoints,
    required this.hasSelection,
    required this.onModeChanged,
    required this.onFinish,
    required this.onDeleteSelected,
    required this.onClearAll,
  });

  final DrawMode drawMode;
  final bool hasActivePoints;
  final bool hasSelection;
  final ValueChanged<DrawMode> onModeChanged;
  final VoidCallback onFinish;
  final VoidCallback onDeleteSelected;
  final VoidCallback onClearAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900]!.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ToolbarButton(
            icon: Icons.pan_tool_outlined,
            tooltip: 'Pan (no drawing)',
            isActive: drawMode == DrawMode.none,
            onTap: () => onModeChanged(DrawMode.none),
          ),
          const _ToolbarDivider(),
          _ToolbarButton(
            icon: Icons.touch_app_outlined,
            tooltip: 'Select shape',
            isActive: drawMode == DrawMode.select,
            activeColor: const Color(0xFFF97316),
            onTap: () => onModeChanged(DrawMode.select),
          ),
          const _ToolbarDivider(),
          _ToolbarButton(
            icon: Icons.place_outlined,
            tooltip: 'Place point',
            isActive: drawMode == DrawMode.point,
            onTap: () => onModeChanged(DrawMode.point),
          ),
          _ToolbarButton(
            icon: Icons.timeline,
            tooltip: 'Draw line',
            isActive: drawMode == DrawMode.line,
            onTap: () => onModeChanged(DrawMode.line),
          ),
          _ToolbarButton(
            icon: Icons.pentagon_outlined,
            tooltip: 'Draw polygon',
            isActive: drawMode == DrawMode.polygon,
            onTap: () => onModeChanged(DrawMode.polygon),
          ),
          if (hasActivePoints &&
              (drawMode == DrawMode.line || drawMode == DrawMode.polygon)) ...[
            const _ToolbarDivider(),
            _ToolbarButton(
              icon: Icons.check_circle_outline,
              tooltip: 'Finish shape',
              isActive: false,
              activeColor: Colors.green,
              onTap: onFinish,
            ),
          ],
          const _ToolbarDivider(),
          if (hasSelection)
            _ToolbarButton(
              icon: Icons.delete_rounded,
              tooltip: 'Delete selected shape',
              isActive: false,
              activeColor: Colors.redAccent,
              onTap: onDeleteSelected,
            ),
          _ToolbarButton(
            icon: Icons.delete_sweep_outlined,
            tooltip: 'Clear all shapes',
            isActive: false,
            activeColor: Colors.red[800]!,
            onTap: onClearAll,
          ),
        ],
      ),
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  const _ToolbarButton({
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
        isActive ? (activeColor ?? const Color(0xFF3B82F6)) : Colors.white70;

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
                ? (activeColor ?? const Color(0xFF3B82F6)).withOpacity(0.18)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
      ),
    );
  }
}

class _ToolbarDivider extends StatelessWidget {
  const _ToolbarDivider();

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
