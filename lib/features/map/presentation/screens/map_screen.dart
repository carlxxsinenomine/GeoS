import 'package:flutter/material.dart';
import 'package:geos/features/map/data/models/draw_mode.dart';
import 'package:geos/features/map/presentation/view_models/draw_controller.dart';
import 'package:geos/features/map/presentation/widgets/draw_toolbar.dart';
import 'package:geos/shared/widgets/bottom_nav.dart';
import 'package:go_router/go_router.dart';
import 'package:maplibre/maplibre.dart';


class MapScreen extends StatefulWidget {
  static const String path = '/map';
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final DrawController _draw = DrawController();

  void _onMapCreated(MapController controller) {
    _draw.mapController = controller;
  }

  Future<void> _onStyleLoaded(StyleController style) async {
    _draw.styleController = style;
    style.setProjection(MapProjection.globe);
    await _draw.initLayers();
  }

  void _onMapEvent(MapEvent event) {
    if (event is! MapEventClick) return;

    if (_draw.drawMode == DrawMode.select) {
      _draw.handleSelectTap(event.point, event.screenPoint);
    } else if (_draw.drawMode != DrawMode.none) {
      _draw.handleDrawTap(event.point);
    }
  }

  @override
  void dispose() {
    _draw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String currentPath = GoRouterState.of(context).uri.toString();

    return Scaffold(
      body: Stack(
        children: [
          Container(),
          MapLibreMap(
            options: MapOptions(
              initCenter: Geographic(lon: 121.7740, lat: 12.8797),
              initZoom: 4.5,
              initStyle: 'https://tiles.openfreemap.org/styles/dark',
              gestures: MapGestures.all(),
            ),
            onMapCreated: _onMapCreated,
            onStyleLoaded: _onStyleLoaded,
            onEvent: _onMapEvent,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    MapControlButtons(
                      showTrackLocation: true,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: 8),
                    ListenableBuilder(
                      listenable: _draw,
                      builder: (_, _) => DrawToolbar(
                        drawMode: _draw.drawMode,
                        hasActivePoints: _draw.currentPoints.isNotEmpty,
                        hasSelection: _draw.selectedIndex >= 0,
                        onModeChanged: _draw.setMode,
                        onFinish: _draw.finishShape,
                        onDeleteSelected: _draw.deleteSelected,
                        onClearAll: _draw.clearAll,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
