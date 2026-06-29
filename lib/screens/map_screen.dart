import 'package:flutter/material.dart';
import 'package:geos/components/nav_button.dart';
import 'package:maplibre/maplibre.dart';

import '../controllers/draw_controller.dart';
import '../models/draw_mode.dart';
import '../widgets/draw_toolbar.dart';

class MapScreen extends StatefulWidget {
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
                      builder: (_, __) => DrawToolbar(
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
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavButton(isActive: false, text: 'Home', icon: Icons.home,),
                  NavButton(isActive: true, text: 'Map', icon: Icons.map_rounded,),
                  NavButton(isActive: false, text: 'Profile', icon: Icons.person,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
