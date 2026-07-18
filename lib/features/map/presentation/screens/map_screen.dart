import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/features/map/data/models/draw_mode.dart';
import 'package:geos/features/map/presentation/view_models/draw_controller.dart';
import 'package:geos/features/map/presentation/widgets/draw_toolbar.dart';
import 'package:maplibre/maplibre.dart';

class MapScreen extends ConsumerStatefulWidget {
  static const String path = '/map';
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {

  void _onMapCreated(MapController controller) {
    ref.read(drawProvider.notifier).mapController = controller;
  }

  Future<void> _onStyleLoaded(StyleController style) async {
    final drawNotifier = ref.read(drawProvider.notifier);

    drawNotifier.styleController = style;
    style.setProjection(MapProjection.globe);
    await drawNotifier.initLayers();
  }

  void _onMapEvent(MapEvent event) {
    if (event is! MapEventClick) return;

    // ref.read for callbacks
    final drawState = ref.read(drawProvider);
    final drawNotifier = ref.read(drawProvider.notifier);

    if (drawState.drawMode == DrawMode.select) {
      drawNotifier.handleSelectTap(event.point, event.screenPoint);
    } else if (drawState.drawMode != DrawMode.none) {
      drawNotifier.handleDrawTap(event.point);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final drawState = ref.watch(drawProvider);

    // Read the notifier to pass its functions as callbacks
    final drawNotifier = ref.read(drawProvider.notifier);

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
                    DrawToolbar(
                      drawMode: drawState.drawMode,
                      hasActivePoints: drawState.currentPoints.isNotEmpty,
                      hasSelection: drawState.selectedIndex >= 0,
                      onModeChanged: drawNotifier.setMode,
                      onFinish: drawNotifier.finishShape,
                      onDeleteSelected: drawNotifier.deleteSelected,
                      onClearAll: drawNotifier.clearAll,
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