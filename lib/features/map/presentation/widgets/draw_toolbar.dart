import 'package:flutter/material.dart';
import 'package:geos/features/map/presentation/widgets/toolbar_button.dart';
import 'package:geos/features/map/presentation/widgets/toolbar_divider.dart';

import '../../data/models/draw_mode.dart';

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

  /// This calls [setMode] func from the [DrawNotifier] class
  final ValueChanged<DrawMode> onModeChanged;

  final VoidCallback onFinish;
  final VoidCallback onDeleteSelected;
  final VoidCallback onClearAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
          ToolbarButton(
            icon: Icons.pan_tool_outlined,
            tooltip: 'Pan (no drawing)',
            isActive: drawMode == DrawMode.none,
            onTap: () => onModeChanged(DrawMode.none),
          ),
          const ToolbarDivider(),
          ToolbarButton(
            icon: Icons.touch_app_outlined,
            tooltip: 'Select shape',
            isActive: drawMode == DrawMode.select,
            activeColor: Colors.blueGrey,
            onTap: () => onModeChanged(DrawMode.select),
          ),
          const ToolbarDivider(),
          ToolbarButton(
            icon: Icons.place_outlined,
            tooltip: 'Place point',
            isActive: drawMode == DrawMode.point,
            onTap: () => onModeChanged(DrawMode.point),
          ),
          ToolbarButton(
            icon: Icons.timeline,
            tooltip: 'Draw line',
            isActive: drawMode == DrawMode.line,
            onTap: () => onModeChanged(DrawMode.line),
          ),
          ToolbarButton(
            icon: Icons.pentagon_outlined,
            tooltip: 'Draw polygon',
            isActive: drawMode == DrawMode.polygon,
            onTap: () => onModeChanged(DrawMode.polygon),
          ),
          if (hasActivePoints &&
              (drawMode == DrawMode.line || drawMode == DrawMode.polygon)) ...[
            const ToolbarDivider(),
            ToolbarButton(
              icon: Icons.check_circle_outline,
              tooltip: 'Finish shape',
              isActive: false,
              activeColor: Colors.green,
              onTap: onFinish,
            ),
          ],
          const ToolbarDivider(),
          if (hasSelection)
            ToolbarButton(
              icon: Icons.delete_rounded,
              tooltip: 'Delete selected shape',
              isActive: false,
              activeColor: Colors.redAccent,
              onTap: onDeleteSelected,
            ),
          ToolbarButton(
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