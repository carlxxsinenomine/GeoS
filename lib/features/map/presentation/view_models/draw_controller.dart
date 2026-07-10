import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:geos/core/utils/geo_utils.dart';
import 'package:geos/core/utils/geojson_builder.dart';
import 'package:geos/core/utils/map_layer_ids.dart';
import 'package:geos/features/map/data/models/draw_mode.dart';
import 'package:maplibre/maplibre.dart';


class DrawController extends ChangeNotifier {
  MapController? mapController;
  StyleController? styleController;
  DrawMode drawMode = DrawMode.none;
  final List<Geographic> currentPoints = [];
  final List<Map<String, dynamic>> features = [];
  int selectedIndex = -1;
  int _nextId = 0;
  bool _layersAdded = false;

  Future<void> initLayers() async {
    if (styleController == null || _layersAdded) return;

    await styleController!.addSource(
      GeoJsonSource(id: MapLayerIds.source, data: _buildGeoJson()),
    );

    const unselected = ['!=', ['get', 'selected'], true];
    const selected   = ['==', ['get', 'selected'], true];

    await styleController!.addLayer(FillStyleLayer(
      id: MapLayerIds.fill,
      sourceId: MapLayerIds.source,
      filter: unselected,
      paint: const {
        'fill-color': '#3B82F6',
        'fill-opacity': 0.35,
        'fill-outline-color': '#3B82F6',
      },
    ));

    await styleController!.addLayer(LineStyleLayer(
      id: MapLayerIds.line,
      sourceId: MapLayerIds.source,
      filter: unselected,
      paint: const {'line-color': '#3B82F6', 'line-width': 2.5},
    ));

    await styleController!.addLayer(CircleStyleLayer(
      id: MapLayerIds.circle,
      sourceId: MapLayerIds.source,
      filter: unselected,
      paint: const {
        'circle-color': '#FFFFFF',
        'circle-radius': 5.0,
        'circle-stroke-color': '#3B82F6',
        'circle-stroke-width': 2.0,
      },
    ));

    await styleController!.addLayer(FillStyleLayer(
      id: MapLayerIds.selFill,
      sourceId: MapLayerIds.source,
      filter: selected,
      paint: const {
        'fill-color': '#F97316',
        'fill-opacity': 0.45,
        'fill-outline-color': '#F97316',
      },
    ));

    await styleController!.addLayer(LineStyleLayer(
      id: MapLayerIds.selLine,
      sourceId: MapLayerIds.source,
      filter: selected,
      paint: const {'line-color': '#F97316', 'line-width': 3.0},
    ));

    await styleController!.addLayer(CircleStyleLayer(
      id: MapLayerIds.selCircle,
      sourceId: MapLayerIds.source,
      filter: selected,
      paint: const {
        'circle-color': '#FFF7ED',
        'circle-radius': 6.0,
        'circle-stroke-color': '#F97316',
        'circle-stroke-width': 2.5,
      },
    ));

    _layersAdded = true;
  }

  Future<void> _refreshSource() async {
    if (styleController == null || !_layersAdded) return;
    await styleController!.updateGeoJsonSource(
      id: MapLayerIds.source,
      data: _buildGeoJson(),
    );
  }

  String _buildGeoJson() => GeoJsonBuilder.buildFeatureCollection(
        features: features,
        selectedIndex: selectedIndex,
        previewPoints: currentPoints,
        drawMode: drawMode,
      );

  Future<void> setMode(DrawMode mode) async {
    if (mode != drawMode || currentPoints.isNotEmpty) {
      currentPoints.clear();
      await _refreshSource();
    }

    if (mode != DrawMode.select && selectedIndex != -1) {
      selectedIndex = -1;
      await _refreshSource();
    }

    drawMode = (mode == drawMode) ? DrawMode.none : mode;
    notifyListeners();
  }

  Future<void> handleDrawTap(Geographic point) async {
    switch (drawMode) {
      case DrawMode.point:
        features.add(GeoJsonBuilder.pointFeature(point, id: _nextId++));
        notifyListeners();
        await _refreshSource();

      case DrawMode.line:
      case DrawMode.polygon:
        currentPoints.add(point);
        notifyListeners();
        await _refreshSource();

      case DrawMode.none:
      case DrawMode.select:
        break;
    }
  }

  Future<void> finishShape() async {
    final id = _nextId++;
    if (drawMode == DrawMode.line && currentPoints.length >= 2) {
      features.add(GeoJsonBuilder.lineFeature(currentPoints, id: id));
    } else if (drawMode == DrawMode.polygon && currentPoints.length >= 3) {
      features.add(GeoJsonBuilder.polygonFeature(currentPoints, id: id));
    }
    currentPoints.clear();
    notifyListeners();
    await _refreshSource();
  }

  Future<void> handleSelectTap(Geographic tapped, Offset screenPoint) async {
    final hits = mapController?.queryLayers(screenPoint) ?? [];
    final hitDrawLayer = hits.any((h) => h.sourceId == MapLayerIds.source);

    if (!hitDrawLayer) {
      if (selectedIndex != -1) {
        selectedIndex = -1;
        notifyListeners();
        await _refreshSource();
      }
      return;
    }

    double bestDist = double.infinity;
    int bestIdx = -1;

    for (int i = 0; i < features.length; i++) {
      final d = GeoUtils.distanceToFeature(features[i], tapped.lon, tapped.lat);
      if (d < bestDist) {
        bestDist = d;
        bestIdx = i;
      }
    }

    selectedIndex = bestIdx;
    notifyListeners();
    await _refreshSource();
  }

  Future<void> deleteSelected() async {
    if (selectedIndex < 0 || selectedIndex >= features.length) return;
    features.removeAt(selectedIndex);
    selectedIndex = -1;
    notifyListeners();
    await _refreshSource();
  }

  Future<void> clearAll() async {
    features.clear();
    currentPoints.clear();
    selectedIndex = -1;
    notifyListeners();
    await _refreshSource();
  }
}
