import 'package:flutter/material.dart';
import 'package:maplibre/maplibre.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapLibreMap(
        options: MapOptions(
          initCenter: Geographic(lon:  121.7740, lat: 12.8797),
          initZoom: 4.5,
          gestures: MapGestures.all()
        ),
        onMapCreated: (controller) {
          _mapController = controller;
        },
        onStyleLoaded: (style) {
          style.setProjection(MapProjection.globe);
        },
        children: [
          MapControlButtons(showTrackLocation: true,)
        ],
      ),
    );
  }
}
