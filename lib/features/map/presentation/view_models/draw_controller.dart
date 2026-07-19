import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/core/utils/geo_utils.dart';
import 'package:geos/core/utils/geojson_builder.dart';
import 'package:geos/core/utils/map_layer_ids.dart';
import 'package:geos/features/map/data/models/draw_mode.dart';
import 'package:geos/features/map/presentation/widgets/draw_toolbar.dart';
import 'package:maplibre/maplibre.dart';

/// immutable State class to hold the UI data, this will serve as the
/// state of the [DrawNotifier]
class DrawState {
  final DrawMode drawMode;
  final List<Geographic> currentPoints;
  final List<Map<String, dynamic>> features;
  final int selectedIndex;

  const DrawState({
    this.drawMode = DrawMode.none,
    this.currentPoints = const [],
    this.features = const [],
    this.selectedIndex = -1,
  });

  DrawState copyWith({
    DrawMode? drawMode,
    List<Geographic>? currentPoints,
    List<Map<String, dynamic>>? features,
    int? selectedIndex,
  }) {
    return DrawState(
      drawMode: drawMode ?? this.drawMode,
      currentPoints: currentPoints ?? this.currentPoints,
      features: features ?? this.features,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}

final drawProvider = NotifierProvider<DrawNotifier, DrawState>(() {
  return DrawNotifier();
});

class DrawNotifier extends Notifier<DrawState> {
  /// Keep controllers and internal variables outside of the state
  /// because they don't directly trigger UI rebuilds.
  MapController? mapController;
  StyleController? styleController;
  int _nextId = 0;
  bool _layersAdded = false;

  @override
  DrawState build() {
    return const DrawState();
  }

  Future<void> initLayers() async {
    if (styleController == null || _layersAdded) return;

    await styleController!.addSource(
      GeoJsonSource(id: MapLayerIds.source, data: _buildGeoJson()),
    );

    const unselected = ['!=', ['get', 'selected'], true];
    const selected = ['==', ['get', 'selected'], true];

    /// Normal Style if not selected
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

    /// Style if selected
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
    features: state.features,
    selectedIndex: state.selectedIndex,
    previewPoints: state.currentPoints,
    drawMode: state.drawMode,
  );
  /// This is used on the [DrawToolbar] class
  /// every time the user changes mode
  Future<void> setMode(DrawMode mode) async {
    bool needsRefresh = false;
    List<Geographic> newPoints = List.of(state.currentPoints);
    int newSelectedIndex = state.selectedIndex;

    if (mode != state.drawMode || newPoints.isNotEmpty) {
      newPoints.clear();
      needsRefresh = true;
    }

    if (mode != DrawMode.select && newSelectedIndex != -1) {
      newSelectedIndex = -1;
      needsRefresh = true;
    }

    DrawMode newMode = (mode == state.drawMode) ? DrawMode.none : mode;

    // Update state to trigger rebuilds
    state = state.copyWith(
      drawMode: newMode,
      currentPoints: newPoints,
      selectedIndex: newSelectedIndex,
    );

    if (needsRefresh) await _refreshSource();
  }

  /// This is for handling drawing shapes
  /// like, Point, LineString, and Polygon
  Future<void> handleDrawTap(Geographic point) async {
    switch (state.drawMode) {
      case DrawMode.point:
        final newFeatures = [...state.features, GeoJsonBuilder.pointFeature(point, id: _nextId++)];
        state = state.copyWith(features: newFeatures);
        await _refreshSource();

      case DrawMode.line:
      case DrawMode.polygon:
        final newPoints = [...state.currentPoints, point];
        state = state.copyWith(currentPoints: newPoints);
        await _refreshSource();

      case DrawMode.none:
      case DrawMode.select:
        break;
    }
  }

  /// Once the user is finished drawing shapes, click this to save
  Future<void> finishShape() async {
    final id = _nextId++;
    final newFeatures = List<Map<String, dynamic>>.of(state.features);

    if (state.drawMode == DrawMode.line && state.currentPoints.length >= 2) {
      newFeatures.add(GeoJsonBuilder.lineFeature(state.currentPoints, id: id));
    } else if (state.drawMode == DrawMode.polygon && state.currentPoints.length >= 3) {
      newFeatures.add(GeoJsonBuilder.polygonFeature(state.currentPoints, id: id));
    }

    state = state.copyWith(
      features: newFeatures,
      currentPoints: [], // Clear points
    );
    if (kDebugMode) {
      print("Features ########################: ${state.features}");
    }
    await _refreshSource();
  }

  /// When select is enabled on the toolbar
  /// This let's you select a shape on the map
  Future<void> handleSelectTap(Geographic tapped, Offset screenPoint) async {
    final hits = mapController?.queryLayers(screenPoint) ?? [];
    final hitDrawLayer = hits.any((h) => h.sourceId == MapLayerIds.source);

    if (!hitDrawLayer) {
      if (state.selectedIndex != -1) {
        state = state.copyWith(selectedIndex: -1);
        await _refreshSource();
      }
      return;
    }

    double bestDist = double.infinity;
    int bestIdx = -1;

    for (int i = 0; i < state.features.length; i++) {
      final d = GeoUtils.distanceToFeature(state.features[i], tapped.lon, tapped.lat);
      if (d < bestDist) {
        bestDist = d;
        bestIdx = i;
      }
    }

    state = state.copyWith(selectedIndex: bestIdx);
    await _refreshSource();
  }

  /// To delete a specific shape on the map
  /// This is available if handleSelectTap is enabled
  Future<void> deleteSelected() async {
    if (state.selectedIndex < 0 || state.selectedIndex >= state.features.length) return;

    final newFeatures = List<Map<String, dynamic>>.of(state.features);
    newFeatures.removeAt(state.selectedIndex);

    state = state.copyWith(
      features: newFeatures,
      selectedIndex: -1,
    );
    await _refreshSource();
  }

  /// Clears all existing shapes
  Future<void> clearAll() async {
    state = state.copyWith(
      features: [],
      currentPoints: [],
      selectedIndex: -1,
    );
    await _refreshSource();
  }
}